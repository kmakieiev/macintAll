import os
import subprocess

def get_ssd_info():
    try:
        system_attributes = os.statvfs('/')
        device_id = os.stat('/').st_dev
        device_path = ''
        for root, dirs, files in os.walk('/dev'):
            for name in files:
                if os.stat(os.path.join(root, name)).st_rdev == device_id:
                    device_path = os.path.join(root, name)
                    break
        if device_path != '':
            volume_name = subprocess.check_output(['diskutil', 'info', '-plist', device_path]).decode('utf-8')
            volume_name= volume_name.split('<key>VolumeName</key>')[1].split('<string>')[1].split('</string>')[0]
        else:
            volume_name = 'Unknown'
        capacity = system_attributes.f_frsize * system_attributes.f_blocks
        capacity_in_gb = capacity / (1024.0 ** 3)
        return (volume_name, capacity_in_gb)
    except Exception as e:
        return f"Error getting system attributes: {str(e)}"

volume_name, capacity = get_ssd_info()
print(f"{volume_name}")
print(f"{capacity:.2f} GB")

