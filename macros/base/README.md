## Output filename format FDM

input_filename_base
printing_filament_types
total_cost
used_filament

## Start
```
;[timestamp]

M107   ; disable fan
G21    ; set units to millimeters
G90    ; use absolute coordinates
M82    ; use absolute distances for extrusion
G92 E0 ; reset extrusion distance

SET_PRINT_STATS_INFO TOTAL_LAYER=[total_layer_count]

M104 S[nozzle_temperature_initial_layer]
M140 S[bed_temperature_initial_layer_single]

PRINT_START EXTRUDER=[nozzle_temperature_initial_layer] BED=[bed_temperature_initial_layer_single] {% if chamber_temperature > 0 %}CHAMBER=[chamber_temperature] {% endif  %} MATERIAL="{filament_type[initial_tool]}" PLATE="{curr_bed_type}" LAYERS=[total_layer_count]
```

## End
```
PRINT_END
```

## Before layer change
```
BEFORE_LAYER_CHANGE LAYER=[layer_num] HEIGHT=[layer_z]
```

## layer changed
```
; layer {layer_num+1} from [total_layer_count]
SET_PRINT_STATS_INFO CURRENT_LAYER={layer_num}
LAYER_CHANGE LAYER=[layer_num] HEIGHT=[layer_z]
```

## Timelapse take frame
```
TAKE_FRAME
```

## Chnage filament
```
FILAMENT_CHANGE
```

## Pause
```
PAUSE
```

## Filament start
```
; filament start gcode
{if (bed_temperature[current_extruder] > 80)||(bed_temperature_initial_layer[current_extruder] > 80 )}
    M106 P3 S255
{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] > 60)}
    M106 P3 S180
{endif}

{if activate_air_filtration[current_extruder] && support_air_filtration}
    M106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} 
{endif}
```


## filament end
```
M106 P3 S0
```