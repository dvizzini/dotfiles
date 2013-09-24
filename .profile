export PIG_OPTS="$PIG_OPTS -Djava.library.path=/usr/lib/hadoop/lib/native/Linux-amd64-64 -Dmapred.job.queue.name=hdmi-set -Dmapred.child.java.opts=-Xmx2048m -Dmapred.task.timeout=0"
export HIVE_OPTS="$HIVE_OPTS -hiveconf mapred.job.queue.name=hdmi-set"
export HIVE_AUX_JARS_PATH=/home/hadoop/lib/HiveUDF.jar
export JAVA_HOME="/usr/java/jdk1.6.0_16/"

if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi
