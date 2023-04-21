# From https://github.com/justinlhudson/Config-And-Setup/blob/master/Windows/MouseInvert.ps1

# I have seen where a USB mouse plugged in doesn't have all the values specified under
# Device Parameters. I've had to add it manually in order
Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Enum\HID\*\*\Device Parameters" FlipFlopWheel -EA 0 | ForEach-Object { Set-ItemProperty $_.PSPath FlipFlopWheel 1 }

# This didn't work for me when using a MSFT Precision Mouse
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID\VID_045E&PID_082A&MI_00&Col01\c&16724d53&0&0000
# Under the Device Parameters key, there was no FlipFlopWheel value only HScrollHighResolutionDisable and VScrollHighResolutionDisable
# I manually added FlipFlopWheel.
# The other value that seems to indicate it was a mouse is the:
# Service (REZ_SZ) = mouhid
# UpperFilters (REG_MULTI_SZ) = Point64