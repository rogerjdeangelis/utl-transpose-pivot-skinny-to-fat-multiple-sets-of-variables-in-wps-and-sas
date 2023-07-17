%let pgm=utl-transpose-pivot-skinny-to-fat-multiple-sets-of-variables-in-wps-and-sas;

Transpose pivot skinny to fat multiple sets of variables in wps and sas

For complete post see (has list of related repositories)

github
https://tinyurl.com/24jynb3w
https://github.com/rogerjdeangelis/utl-transpose-pivot-skinny-to-fat-multiple-sets-of-variables-in-wps-and-sas

https://stackoverflow.com/questions/76393224/transposing-partial-data-in-sas

Solutions

    1 WPS (one line of code)
      utl_transpose( data=sd1.have,by=desc_cd item_cd,var=abc line_nbr type_cd val1-val3,out=want)

    2 SAS (one line of code)
      utl_transpose( data=sd1.have,by=desc_cd item_cd,var=abc line_nbr type_cd val1-val3,out=want)

Related Transpose Repositories on github see

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

libname sd1 "d:/sd1";
data sd1.have;
   input desc_cd item_cd abc line_nbr type_cd val1-val3;
cards4;
100 458 15 1  3 50    0 100
100 458 15 2  6  0  150   0
100 458 15 3  9 50  150   0
225 778 41 1  3 50    0 100
225 778 41 2  6  0  150   0
225 778 41 4 12  0 1990 230
225 778 41 3  9 50  150   0
;;;;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/* Up to 40 obs from last table SD1.HAVE total obs=7 17MAY2023:09:28:09                                                   */
/*                                                                                                                        */
/* Obs    DESC_CD    ITEM_CD    ABC    LINE_NBR    TYPE_CD    VAL1    VAL2    VAL3                                        */
/*                                                                                                                        */
/*  1       100        458       15        1           3       50        0     100                                        */
/*  2       100        458       15        2           6        0      150       0                                        */
/*  3       100        458       15        3           9       50      150       0                                        */
/*  4       225        778       41        1           3       50        0     100                                        */
/*  5       225        778       41        2           6        0      150       0                                        */
/*  6       225        778       41        4          12        0     1990     230                                        */
/*  7       225        778       41        3           9       50      150       0                                        */
/*                                                                                                                        */
/**************************************************************************************************************************/
/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/
/**************************************************************************************************************************/
/*                                                                                                                        */
/* Middle Observation(1 ) of table =  - Total Obs 2 17MAY2023:09:30:14                                                    */
/*                                                                                                                        */
/*  -- NUMERIC --                                                                                                         */
/*                                                                                                                        */
/*               TYPE           LENGTH                                                                                    */
/* DESC_CD         N8             100    KEY                                                                              */
/* ITEM_CD         N8             458                                                                                     */
/* ABC1            N8              15                                                                                     */
/*                                                                                                                        */
/* LINE_NBR1       N8               1                                                                                     */
/* TYPE_CD1        N8               3                                                                                     */
/* VAL11           N8              50                                                                                     */
/* VAL21           N8               0                                                                                     */
/* VAL31           N8             100                                                                                     */
/* ABC2            N8              15                                                                                     */
/* LINE_NBR2       N8               2                                                                                     */
/* TYPE_CD2        N8               6                                                                                     */
/* VAL12           N8               0                                                                                     */
/* VAL22           N8             150                                                                                     */
/* VAL32           N8               0                                                                                     */
/* ABC3            N8              15                                                                                     */
/* LINE_NBR3       N8               3                                                                                     */
/* TYPE_CD3        N8               9                                                                                     */
/* VAL13           N8              50                                                                                     */
/* VAL23           N8             150                                                                                     */
/* VAL33           N8               0                                                                                     */
/* ABC4            N8               .                                                                                     */
/* LINE_NBR4       N8               .                                                                                     */
/* TYPE_CD4        N8               .                                                                                     */
/* VAL14           N8               .                                                                                     */
/* VAL24           N8               .                                                                                     */
/* VAL34           N8               .                                                                                     */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*
/ | __      ___ __  ___
| | \ \ /\ / / `_ \/ __|
| |  \ V  V /| |_) \__ \
|_|   \_/\_/ | .__/|___/
             |_|
*/

proc datasets lib=sd1 nolist nodetails;delete want; run;quit;

%utl_submit_wps64x('
libname sd1 "d:/sd1";
options sasautos="c:/otowps";
%utl_transpose(data=sd1.have,by=desc_cd item_cd,var=abc line_nbr type_cd val1-val3,out=sd1.want);
proc print data=sd1.want;
run;quit;
');

/*___
|___ \   ___  __ _ ___
  __) | / __|/ _` / __|
 / __/  \__ \ (_| \__ \
|_____| |___/\__,_|___/

*/

proc datasets lib=sd1 nolist nodetails;delete want; run;quit;

%utl_transpose(data=sd1.have,by=desc_cd item_cd,var=abc line_nbr type_cd val1-val3,out=sd1.want);


/**************************************************************************************************************************/
/*                                                                                                                        */
/* The WPS System                                                                                                         */
/*                                                                                                                        */
/* Middle Observation(1 ) of table =  - Total Obs 2 17MAY2023:09:40:32                                                    */
/*                                                                                                                        */
/*  -- NUMERIC --                                                                                                         */
/*                                                                                                                        */
/*               TYPE           LENGTH                                                                                    */
/* DESC_CD         N8             100    KEY                                                                              */
/* ITEM_CD         N8             458                                                                                     */
/* ABC1            N8              15                                                                                     */
/*                                                                                                                        */
/* LINE_NBR1       N8               1                                                                                     */
/* TYPE_CD1        N8               3                                                                                     */
/* VAL11           N8              50                                                                                     */
/* VAL21           N8               0                                                                                     */
/* VAL31           N8             100                                                                                     */
/* ABC2            N8              15                                                                                     */
/* LINE_NBR2       N8               2                                                                                     */
/* TYPE_CD2        N8               6                                                                                     */
/* VAL12           N8               0                                                                                     */
/* VAL22           N8             150                                                                                     */
/* VAL32           N8               0                                                                                     */
/* ABC3            N8              15                                                                                     */
/* LINE_NBR3       N8               3                                                                                     */
/* TYPE_CD3        N8               9                                                                                     */
/* VAL13           N8              50                                                                                     */
/* VAL23           N8             150                                                                                     */
/* VAL33           N8               0                                                                                     */
/* ABC4            N8               .                                                                                     */
/* LINE_NBR4       N8               .                                                                                     */
/* TYPE_CD4        N8               .                                                                                     */
/* VAL14           N8               .                                                                                     */
/* VAL24           N8               .                                                                                     */
/* VAL34           N8               .                                                                                     */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/


/*        _       _           _                            _ _             _
 _ __ ___| | __ _| |_ ___  __| |  _ __ ___ _ __   ___  ___(_) |_ ___  _ __(_) ___  ___
| `__/ _ \ |/ _` | __/ _ \/ _` | | `__/ _ \ `_ \ / _ \/ __| | __/ _ \| `__| |/ _ \/ __|
| | |  __/ | (_| | ||  __/ (_| | | | |  __/ |_) | (_) \__ \ | || (_) | |  | |  __/\__ \
|_|  \___|_|\__,_|\__\___|\__,_| |_|  \___| .__/ \___/|___/_|\__\___/|_|  |_|\___||___/
                                          |_|

*/

see github
