Docker image to run a Timemachine server using netatalk/afpd.

Run with:

`docker run -e PASSWORD=yourpassword --name timemachine -p 548:548 -v /mnt/backup:/backup aequitas/timemachine`

