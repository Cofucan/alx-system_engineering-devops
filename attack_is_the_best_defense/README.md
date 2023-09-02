# Sniffing An Unsecured Network

In this project, I use `tcdump` to sniff packets between an unsecured network in order to get a password. Here are some commands:

Capture and show all packet headers from all devices continually

```sh
sudo tcpdump --interface any
```

Capture and show only 300 headers packets from all devices

```sh
sudo tcpdump --interface any -c 300
```

Capture and show packet headers with the IP address and ports instead of host names

```sh
sudo tcpdump --interface any -nn
```

Capture 200 packets and save them in binary format to a file called `sniff.pcap`, also show how many packets are being captured using the verbose flag

```sh
sudo tcpdump --interface -c 200 -nn -w sniff.pcap -v
```

Read the packets from the saved binary file, display the headers as well as the packet information in ASCII format `-A` flag. You can use `-H` flag instead if you want to see them in hex format

```sh
sudo tcpdump --interface -r sniff.pcap -A
```
