#!/bin/bash

ask_to_save(){
	read -p "Save data to file? (Y/N): " answer

	if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
		filename=$(date +"%d_%m_%y_%H_%M_%S.status")
		print_info > "$filename"
		echo "Saved to $filename"
        else
                echo "Not saved"
        fi
}
