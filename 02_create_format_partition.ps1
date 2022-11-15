# Show disk information:
Get-Disk

# Initialize hard drive with number 1 (first partition 0 exists already)
Initialize-Disk -Number 1 -PartitionStyle MBR

# Create a new partition with letter L and the size of 5GB
New-Partition -DiskNumber 1 -DriveLetter L -IsActive -Size 5GB

# Format the new partition to the NTFS file system
Format-Volume -DriveLetter L -Filesystem NTFS

# Resize the partition to a specific size
Resize-Partition -DriveLetter L -Size 10GB

# If necessary remove the partition (optional command)
Remove-Partition -DriveLetter L

# Finally show all partitions
Get-Partition
