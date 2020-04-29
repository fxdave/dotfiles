# Defined in - @ line 1
function atikill --description 'alias atikill sudo cat /sys/kernel/debug/dri/0/amdgpu_gpu_recover'
	sudo cat /sys/kernel/debug/dri/0/amdgpu_gpu_recover $argv;
end
