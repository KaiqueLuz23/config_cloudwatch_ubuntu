# WGET COM AGENT DA VIRGINIA
wget https://s3.us-east-1.amazonaws.com/amazoncloudwatch-agent-us-east-1/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb 
# INSTALACAO DO AGENT
dpkg -i -E ./amazon-cloudwatch-agent.deb 
cd /opt/aws/amazon-cloudwatch-agent/bin 
# BAIXAR SCRIPT DE COLETA (BASICO) PARA LINUX
scp -i ~/.ssh/id_rsa.pem /home/$USER/Download/config.json ubuntu@IP:/home/ubuntu/
cd /opt/aws/amazon-cloudwatch-agent/etc/ 
cp -av ../bin/config.json amazon-cloudwatch-agent.json 
mkdir -p /usr/share/collectd/ 
touch /usr/share/collectd/types.db 
sudo sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s 
systemctl enable amazon-cloudwatch-agent 
sudo systemctl status amazon-cloudwatch-agent
systemctl status amazon-cloudwatch-agent