# DOC: https://github.com/phusion/baseimage-docker/blob/master/README.md
# 升級容器中的作業系統版本：RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"
FROM phusion/baseimage:noble-1.0.0

# 維護者資料
LABEL maintainer="hankz <hankzhong@june1.com.tw>"

# 其他動作...

########################################
# phusion/baseimage相關設定
########################################

# 設定環境變數，檔案名稱為變數名稱，檔案內容為變數值
COPY init/container_environment /etc/container_environment

# 啟動容器時須執行的腳本，按照腳本名稱順序執行，可以用數字作為腳本開頭做排序
# 注意：腳本預設timeout時間為30秒，可以用KILL_PROCESS_TIMEOUT與KILL_ALL_PROCESSES_TIMEOUT兩個環境變數來修改
COPY init/my_init.d /etc/my_init.d
RUN chmod +x /etc/my_init.d/*

# init命令，不能修改
CMD ["/sbin/my_init"]

# clear cache.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


