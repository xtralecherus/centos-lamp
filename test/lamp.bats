+#! /usr/bin/env bats
+# vim: ft=sh 
+#
+
+@test "port 22 should be listening" {
+result="$(netstat -lnt | awk '$6 == "LISTEN" && $4 ~ ".22"')"
+[ "$?" -eq 0 ]     # exit status should be 0
+[ -n "${result}" ] # output should not be empty
+}
+
+@test "port 80 should be listening" {
+result="$(netstat -lnt | awk '$6 == "LISTEN" && $4 ~ ".80"')"
+[ "$?" -eq 0 ]     # exit status should be 0
+[ -n "${result}" ] # output should not be empty
+}
+
+@test "httpd should be running" {
+result="$(service httpd status | grep '^httpd.*is running\.\.\.$')"
+[ "$?" -eq 0 ]     # exit status should be 0
+[ -n "${result}" ] # output should not be empty
+}
+
+@test "/var/www/html/ should be a directory with perms 755" {
+result="$(stat -c %a /var/www/html/)"
+[ "${result}" = "755" ]
+}
+