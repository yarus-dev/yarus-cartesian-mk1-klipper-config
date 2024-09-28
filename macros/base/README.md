## Output filename
```
{if plate_name!=""}{plate_name}{else}{input_filename_base}{endif}_{filament_type[initial_tool]}_{timestamp}.gcode
```

## Start
```
; Print start g-code Orca
;[timestamp]

SET_PRINT_STATS_INFO TOTAL_LAYER=[total_layer_count]

M104 S[nozzle_temperature_initial_layer]
M140 S[bed_temperature_initial_layer_single]

PRINT_START EXTRUDER=[nozzle_temperature_initial_layer] BED=[bed_temperature_initial_layer_single] CHAMBER={ if overall_chamber_temperature > 0}"[overall_chamber_temperature]"{else}False {endif} MATERIAL="{filament_type[initial_tool]}" PLATE="{curr_bed_type}" LAYERS=[total_layer_count]
```
## End
```
; Print end g-code Orca
PRINT_END
```
## Print by object
```
; Print by object g-code Orca
```
## Before layer change
```
; Before layer change g-code Orca
; layer {layer_num+1} from [total_layer_count]
BEFORE_LAYER_CHANGE LAYER=[layer_num] HEIGHT=[layer_z]
```

## layer changed
```
; layer changed g-code Orca
LAYER_CHANGE LAYER=[layer_num] HEIGHT=[layer_z]
```

## Timelapse take frame
```
; Timelapse take frame g-code Orca
```

## Chnage filament
```
; Chnage filament g-code Orca
FILAMENT_CHANGE
```
## Change extrusion role
```
; Change extrusion role g-code Orca
```
## Pause
```
; Pause g-code Orca
PAUSE
```

## Custom g-code template
```
; Custom g-code template Orca
```

## Filament start
```
; filament start gcode g-code Orca
{if (bed_temperature[current_extruder] > 80)||(bed_temperature_initial_layer[current_extruder] > 80 )}
    M106 P3 S255
{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] > 60)}
    M106 P3 S180
{endif}

{if activate_air_filtration[current_extruder] && support_air_filtration}
    M106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} 
{endif}
```

## Filament end
```
; filament end g-code Orca
M106 P3 S0
```