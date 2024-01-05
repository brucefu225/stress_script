

$LOG_FOLDER/testTempDir

cardDetect/ (){					#必須上driver才可以找到的
	CARD-marvell_Detect_info.sh  
	CARD-Intel_Detect_info.sh	#未完成
	CARD-LSI_Detect_info.sh		#不適合這次
	SWITCHTEC_Detect_info.sh
}


#收集每次 AC,DC,Reboot 迴圈，並且比對每次開機log與Golden_Sample
baseFunction.sh (){     ##目標是 收集每次 AC,DC,Reboot 迴圈，並且比對每次開機log與Golden_Sample
	time1 #第一次迴圈時間
	time2 #測試時間
	TESTTIME #總測試時間
}
baseFunction_Golden_Sample.sh
baseFunction/(){
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
	SYS_Detect_info.sh
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
	DIRbaseFolder.sh	##所有目錄都放在這裡，要放腳本第1順位執行
	logFolder.sh  		##所有共用腳本路徑放在這裡，要放腳本第2順位執行
	allHostname.sh  
	bashcolor.sh
	chmodExeBash.sh      
	clearVar.sh      
	   
	Install_packaged.sh  
	
	menu.sh       
	networkSetup.sh
	runtime.sh
}

# 收集裝備訊息 DETECT，Stress，使用於單次開機，擁有大量指令對裝備收集訊息。
deviceDetect.sh
deviceDetect_Golden_Sample.sh
deviceDetect/ (){
	#log 名稱: $MULTI_COM_DIR/dmidecode_t_${Role}_${TESTTIME_day}.log
	#log 名稱: $MULTI_COM_DIR/${commandName}_${Role}_${TESTTIME_day}_${boot}.log
	#log 名稱: $MULTI_COM_DIR/${commandName}_${Role}_${TESTTIME_day}.log
	BIOS_Detect_multi_command_info.sh    
	BMC_Detect_multi_command_info.sh (){
		需要修改檔名
	}
	MEM_Detect_multi_command_info.sh  
	TPM_Detect_multi_command_info.sh  
	CPU_Detect_multi_command_info.sh   
	NET_Detect_multi_command_info.sh (){
		diff -c NET_eno1_DETECT_20231229.log NET_eno1_DETECT_20231229_Golden_Sample.log ##ok
	}                      
	HDD_Detect_multi_command_info.sh (){
		#暫存檔
		DEVCOUNT=""
		sumSAS=""
		DEVCOUNT=""
		sumNVMe=""
	}  
	PSU_Detect_multi_command_info.sh (){
		需要修改檔名
	}
	USB_Detect_multi_command_info.sh (){
		#暫存檔
		DEVCOUNT ##計算USB個數
		> usbadd1.txt
        > usbadd2.txt
        > usbadd3.txt
		diff -c lsusb_v_003_005_DETECT_20231229.log lsusb_v_003_005_DETECT_20231229_Golden_Sample.log ##ok
	}
		usb1.sh-bak
	VGA_Detect_multi_command_info.sh
		VGA_resolution_8.sh ##再決定要不要保留resolution目錄
	CHIP_Detect_multi_command_info.sh
	TPM_Detect_multi_command_info.sh (){
		diff -c TPM_DETECT_20231229.log TPM_DETECT_20231229_Golden_Sample.log ##OK
	}
}

## 總執行
SUT_power_cycle_Golden_Sample.sh (){
}
