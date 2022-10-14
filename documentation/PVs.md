# ND780 PVs Documentation

<!-- | PV                   | Description  
|----------------------|--------------------|
| <P><R>Key0-Cmd     | Equivalent to key 0 
| <P><R>Key1-Cmd     | Equivalent to key 1  
| <P><R>Key2-Cmd     | Equivalent to key 2  
| <P><R>Key3-Cmd     | Equivalent to key 3  
| <P><R>Key4-Cmd     | Equivalent to key 4  
| <P><R>Key5-Cmd     | Equivalent to key 5  
| <P><R>Key6-Cmd     | Equivalent to key 6  
| <P><R>Key7-Cmd     | Equivalent to key 7  
| <P><R>Key8-Cmd     | Equivalent to key 8  
| <P><R>Key9-Cmd     | Equivalent to key 9  
| <P><R>KeyC-Cmd     | Equivalent to key C  
| <P><R>KeyPoint-Cmd | Equivalent to key . 
| <P><R>KeyMinus-Cmd | Equivalent to key -  
| <P><R>KeyEnt-Cmd   | Equivalent to key enter  
| <P><R>KeyX-Cmd     | Equivalent to key X (Upper orange)  
| <P><R>KeyY-Cmd     | Equivalent to key Y (Middle orange)  
| <P><R>KeyZ-Cmd     | Equivalent to key Z (Lower orange)  
| <P><R>KeyFN1-Cmd   | Equivalent to key Function 1 (1st grey)  
| <P><R>KeyFN2-Cmd   | Equivalent to key Function 2 (2nd grey) 
| <P><R>KeyFN3-Cmd   | Equivalent to key Function 3 (3rd grey) 
| <P><R>KeyFN4-Cmd   | Equivalent to key Function 4 (4th grey)  
| <P><R>KeyLeft-Cmd  | Equivalent to key Left  
| <P><R>KeyRight-Cmd | Equivalent to key Right  
| <P><R>KeyUp-Cmd    | Equivalent to key Up  
| <P><R>KeyDown-Cmd  | Equivalent to key Down   -->

## 1. Monitoring PVs

### **Axis position**

All PVs listed below can be accessed using EPICS `caget` command.

The following PVs store the current position reading for the respective axis: 

- `<P><R>PosX-Mon`
- `<P><R>PosY-Mon`
- `<P><R>PosZ-Mon`

E.g.: `caget pv:name:PosX-Mon` would return current position for X axis input.

### **Measuring mode**

The above reading for each axis might reflect a radius or diameter measure, and might be either differential or absolute values. The PVs below give access to which case it is for the respective axis.

- `<P><R>ModeX-Mon`
- `<P><R>ModeY-Mon`
- `<P><R>ModeZ-Mon`

In which case, the return might be one of the above:
 - Absolute radius
 - Differential radius
 - Absolute diameter
 - Differential diameter

### **Units**

The selected Engineering Units might be inches or millimeters. The PV below stores the current EU, returning either `in` or `mm`:

- `<P><R>EU-Mon`

## 2. Command PVs
The following PVs can be triggered by commanding `caput <desiredPV> 1`.

### **Reset device**

- `<P><R>Rst-Cmd`

The above PV sends command to reset the nd780.

### **Change measurement mode**

- `<P><R>ToggleMode-Cmd`

The above PV toggles between absolute or differential measurements. Alternating between Radius or Diameter modes is not available in this IOC version.

### **Change units**

- `<P><R>ToggleEU-Cmd`

Toggles between inches or millimeters engineering units.

### **Set Zero**

- `<P><R>SetZeroX-Cmd`
- `<P><R>SetZeroY-Cmd`
- `<P><R>SetZeroZ-Cmd`

The above PVs set current axis reading as zero reference.

### **Default settings reset**

- `<P><R>SetDefault-Cmd`


The desired default settings can be manually set to nd780 and exported via serial output to a file named backup.txt. 

Once backup is saved in `nd780App/src/backup.txt`, writing 1 to the above PV results in the system reading this file and uploading it's content to nd780.