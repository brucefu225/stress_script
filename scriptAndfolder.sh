

$LOG_FOLDER/testTempDir

#收集每次 AC,DC,Reboot 迴圈，並且比對每次開機log與Golden_Sample
baseFunction(){
	BIOS_Detect_info.sh
	BMC_Detect_info.sh
	CPU_Detect_info.sh
	HDD_Detect_info.sh
	MEM_Detect_info.sh
	NET_Detect_info.sh
	PCI_Detect_info.sh
	USB_Detect_info.sh
	TPM_Detect_info.sh
	VGA_Detect_info.sh
	CHIP_Detect_info.sh
}

stressDevice (){
	## cpu
		cpu_stress-ng_detect_CPU_PID.sh     
		cpu_stress-ng.sh                   
			CPU_PID.txt                             
			CPU_STRESS_FINISH.txt               
	## hdd	
		hdd_fio_detect_HDD_PID.sh        
		hdd_fio.sh
		HDD-test.fio
			HDD_PID.txt 
	## mem
		mem_stressapptest.sh
		mem_stressapptest_detect_MEM_PID.sh
			MEM_PID.txt
	## net
		net_iperf.sh
		net_iperf_detect_NET_PID.sh
		NET_PID.txt
		NET_STRESS_FINISH.txt
		NET_CLIENT_PID.txt

		iperf_test.sh
}

common(){
	allHostname.sh  
	bashcolor.sh
	chmodExeBash.sh      
	clearVar.sh      
	DIRbaseFolder.sh     
	Install_packaged.sh  
	logFolder.sh  
	menu.sh       
	networkSetup.sh
	runtime.sh
}

# 收集裝備訊息 DETECT，Stress，使用於單次開機，擁有大量指令對裝備收集訊息。
deviceDetect.sh 
deviceDetect (){
	#log 名稱: $MULTI_COM_DIR/dmidecode_t_${Role}_${TESTTIME_day}.log
	#log 名稱: $MULTI_COM_DIR/${commandName}_${Role}_${TESTTIME_day}_${boot}.log
	#log 名稱: $MULTI_COM_DIR/${commandName}_${Role}_${TESTTIME_day}.log
	BIOS_Detect_multi_command_info.sh    
	BMC_Detect_multi_command_info.sh   
	MEM_Detect_multi_command_info.sh  
	TPM_Detect_multi_command_info.sh  
	CPU_Detect_multi_command_info.sh   
	NET_Detect_multi_command_info.sh                        
	HDD_Detect_multi_command_info.sh  
	PSU_Detect_multi_command_info.sh
	USB_Detect_multi_command_info.sh
		usb1.sh-bak
	VGA_Detect_multi_command_info.sh
		VGA_resolution_8.sh
	CHIP_Detect_multi_command_info.sh
}
