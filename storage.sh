#!/bin/sh
sed -i "s#\(base_path\).*#\1=$STORAGE_BASE_PATH#" /etc/fdfs/storage.conf
sed -i "s#\(store_path0\).*#\1=$STORAGE_PATH0#" /etc/fdfs/storage.conf
sed -i "s#\(tracker_server\).*#\1=$TRACKER_SERVER#" /etc/fdfs/storage.conf
sed -i "s#\(http.server_port\).*#\1=$HTTP_SERVER_PORT#" /etc/fdfs/storage.conf

sed -i "s#\(base_path\).*#\1=$STORAGE_BASE_PATH#" /etc/fdfs/mod_fastdfs.conf
sed -i "s#\(store_path0\).*#\1=$STORAGE_PATH0#" /etc/fdfs/mod_fastdfs.conf
sed -i "s#\(tracker_server\).*#\1=$TRACKER_SERVER#" /etc/fdfs/mod_fastdfs.conf
sed -i "s#\(group_count\).*#\1=$GROUP_COUNT#" /etc/fdfs/mod_fastdfs.conf
sed -i "s#\(http.server_port\).*#\1=$HTTP_SERVER_PORT#" /etc/fdfs/mod_fastdfs.conf
sed -i "s#\(url_have_group_name\).*#\1=true#" /etc/fdfs/mod_fastdfs.conf

cat /usr/local/src/group1.template >> /etc/fdfs/mod_fastdfs.conf
cd /etc/fdfs
touch mime.types
/usr/local/nginx/sbin/nginx -t
/usr/local/nginx/sbin/nginx

/usr/bin/fdfs_storaged /etc/fdfs/storage.conf restart
tail -f /export/fastdfs/storage/logs/storaged.log

