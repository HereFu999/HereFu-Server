# ใช้ OpenJDK slim เป็น base image
FROM openjdk:21-jdk-slim

# ตั้ง working directory
WORKDIR /minecraft

# คัดลอกไฟล์ server jar เข้า container
COPY paper-1.21.8-60.jar ./

# ตั้ง port (Railway จะ map port ให้เอง)
EXPOSE 25565

# รัน server ด้วย JVM flags ของคุณ
CMD ["java","-Xms4096M","-Xmx4096M","--add-modules=jdk.incubator.vector","-XX:+UseG1GC","-XX:+ParallelRefProcEnabled","-XX:MaxGCPauseMillis=200","-XX:+UnlockExperimentalVMOptions","-XX:+DisableExplicitGC","-XX:+AlwaysPreTouch","-XX:G1HeapWastePercent=5","-XX:G1MixedGCCountTarget=4","-XX:InitiatingHeapOccupancyPercent=15","-XX:G1MixedGCLiveThresholdPercent=90","-XX:G1RSetUpdatingPauseTimePercent=5","-XX:SurvivorRatio=32","-XX:+PerfDisableSharedMem","-XX:MaxTenuringThreshold=1","-Dusing.aikars.flags=https://mcflags.emc.gs","-Daikars.new.flags=true","-XX:G1NewSizePercent=30","-XX:G1MaxNewSizePercent=40","-XX:G1HeapRegionSize=8M","-XX:G1ReservePercent=20","-jar","paper-1.21.8-60.jar","--nogui"]
