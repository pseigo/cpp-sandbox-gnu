echo "========== BUILD AND FIRST RUN =========="
./build.sh
./bin/Sandbox >> /dev/null # to generate gmon.out

echo
echo "========== VALGRIND - MEMORY CHECK =========="
valgrind --tool=memcheck --leak-check=full ./bin/Sandbox

echo
echo "========== GPROF - TIMING =========="
gprof ./bin/Sandbox -ba
rm gmon.out
