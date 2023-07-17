# utl-transpose-pivot-skinny-to-fat-multiple-sets-of-variables-in-wps-and-sas
Transpose pivot skinny to fat multiple sets of variables in wps and sas 
    %let pgm=utl-transpose-pivot-skinny-to-fat-multiple-sets-of-variables-in-wps-and-sas;

    Transpose pivot skinny to fat multiple sets of variables in wps and sas

    For complete post see (have list of related repositories)

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


    /*        _       _           _                            _ _             _
     _ __ ___| | __ _| |_ ___  __| |  _ __ ___ _ __   ___  ___(_) |_ ___  _ __(_) ___  ___
    | `__/ _ \ |/ _` | __/ _ \/ _` | | `__/ _ \ `_ \ / _ \/ __| | __/ _ \| `__| |/ _ \/ __|
    | | |  __/ | (_| | ||  __/ (_| | | | |  __/ |_) | (_) \__ \ | || (_) | |  | |  __/\__ \
    |_|  \___|_|\__,_|\__\___|\__,_| |_|  \___| .__/ \___/|___/_|\__\___/|_|  |_|\___||___/
                                              |_|

    */

    see github


    https://github.com/rogerjdeangelis/utl-Changing-variable-labels-formats-and-informats-with-proc-sort-transpose-report-and-mean
    https://github.com/rogerjdeangelis/utl-Computing-the-matrix-product-of-a-dataframe-with-its-transpose
    https://github.com/rogerjdeangelis/utl-another-classic-long-to-wide-transpose-using-Arts-untanspose-macro
    https://github.com/rogerjdeangelis/utl-classic-problem-with-proc-transpose-and-mutiple-variables-seven-solutions
    https://github.com/rogerjdeangelis/utl-classic-transpose-by-index-variableid-and-value-in-sas-r-and-python
    https://github.com/rogerjdeangelis/utl-classic-untranspose-problem-posted-in-stackoverflow-r
    https://github.com/rogerjdeangelis/utl-controlling-the-order-of-transposed-variables-using-interleave-set
    https://github.com/rogerjdeangelis/utl-create-a-sorted-summarized-and-transposed-crosstab-dataset-using-a-single-proc
    https://github.com/rogerjdeangelis/utl-create-a-state-diagram-table-hash-corresp-and-transpose
    https://github.com/rogerjdeangelis/utl-fast-normalization-and-join-using-vvaluex-arrays-sql-hash-untranspose-macro
    https://github.com/rogerjdeangelis/utl-formatting-transposed-variable-names
    https://github.com/rogerjdeangelis/utl-improved-transpose-and-string-parser
    https://github.com/rogerjdeangelis/utl-loop-through-one-table-and-find-data-in-next-table--hash-dosubl-arts-transpose
    https://github.com/rogerjdeangelis/utl-minimize-the-space-used-by-a-transposed-table-macro-utl-optlen
    https://github.com/rogerjdeangelis/utl-minimmum-code-to-transpose-and-summarize-a-skinny-to-fat-with-sas-wps-r-and-python
    https://github.com/rogerjdeangelis/utl-normalize-a-table-with-many-columns-flexible-transpose
    https://github.com/rogerjdeangelis/utl-normalizing-multiple-horizontal-arrays-of-variables-using-macro-untranspose
    https://github.com/rogerjdeangelis/utl-pivot-multiple-columns-to-long-format-untranspose
    https://github.com/rogerjdeangelis/utl-pivot-transpose-an-excel-sheet-with-columns-that-are-excel-dates
    https://github.com/rogerjdeangelis/utl-proc-transpose-fat-to-fat
    https://github.com/rogerjdeangelis/utl-reshaping-data-from-long-to-wide-using-transpose-macro
    https://github.com/rogerjdeangelis/utl-sas-proc-transpose-in-sas-r-wps-python-native-and-sql-code
    https://github.com/rogerjdeangelis/utl-sas-proc-transpose-wide-to-long-in-sas-wps-r-python-native-and-sql
    https://github.com/rogerjdeangelis/utl-simple-pivot-or-transpose-of-id-and-value-pairs-in-R-and-SAS
    https://github.com/rogerjdeangelis/utl-simple-transpose-in-R-and-SAS-you-be-the-judge
    https://github.com/rogerjdeangelis/utl-simple-transpose-of-two-variables-using-normalization-gather-and-untranspose
    https://github.com/rogerjdeangelis/utl-sort-summarize-transpose-with-minimal-code-in-one-proc
    https://github.com/rogerjdeangelis/utl-sort-transpose-and-merge-two-tables-packaged-in-a-single-datastep
    https://github.com/rogerjdeangelis/utl-sort-transpose-and-summarize-with-output-dataset-using-just-one-proc
    https://github.com/rogerjdeangelis/utl-the-all-powerfull-proc-report-to-create-transposed-sorted-and-summarized-output-datasets
    https://github.com/rogerjdeangelis/utl-three-algorithms-to-transpose-sets-of-variables
    https://github.com/rogerjdeangelis/utl-transpose-and-apply-several-different-formats-to-the-same-column
    https://github.com/rogerjdeangelis/utl-transpose-and-create-a-state-matrix
    https://github.com/rogerjdeangelis/utl-transpose-and-rename-variables-using-variable-labels-and-class-variables
    https://github.com/rogerjdeangelis/utl-transpose-and-set-all-generated-missing-values-to-zero-five-solutions
    https://github.com/rogerjdeangelis/utl-transpose-fat-to-skinny-pivot-longer-in-sas-wps-r-pythonv
    https://github.com/rogerjdeangelis/utl-transpose-long-to-wide-with-a-twist-add-a-grouping-varible-to-the-input
    https://github.com/rogerjdeangelis/utl-transpose-macro-eliminates-five-steps-transpose-sort-transpose-sort-merge
    https://github.com/rogerjdeangelis/utl-transpose-macro-rather-than-proc-print-report-or-tabulate
    https://github.com/rogerjdeangelis/utl-transpose-matrices-with-base-sas
    https://github.com/rogerjdeangelis/utl-transpose-more-than-one-variable
    https://github.com/rogerjdeangelis/utl-transpose-multiple-rows-into-one-row-do_over-dosubl-and-varlist-macros
    https://github.com/rogerjdeangelis/utl-transpose-mutiple-sets-of-variable-fast-macro-transpose
    https://github.com/rogerjdeangelis/utl-transpose-mutiple-variables-with-complete-missing-levels-and-missing-values
    https://github.com/rogerjdeangelis/utl-transpose-pairs-of-dates-by-groups-or-transposing-mutiple-variables
    https://github.com/rogerjdeangelis/utl-transpose-sets-of-variables-using-Art-Tabachneck-et-all-very-fast-macro
    https://github.com/rogerjdeangelis/utl-transpose-sets-of-variables-with-a-compound-identification-Arts-macro
    https://github.com/rogerjdeangelis/utl-transpose-table-with-duplicate-values
    https://github.com/rogerjdeangelis/utl-transposing-a-complex-data-set-in-sas-arts-transpose-macro
    https://github.com/rogerjdeangelis/utl-transposing-multiple-variables-using-transpose-macro-sql-arrays-proc-report
    https://github.com/rogerjdeangelis/utl-transposing-normalizing-a-table-using-four-techniques-arrays-untranspose-transpose-and-gather
    https://github.com/rogerjdeangelis/utl-transposing-two-variable-to-columns-using-transpose-macro
    https://github.com/rogerjdeangelis/utl-untranspose-mutiple-arrays-fat-to-skinny-or-normalize
    https://github.com/rogerjdeangelis/utl-using-arts-transpose-macro-with-two-unsorted-tables
    https://github.com/rogerjdeangelis/utl-very-complex-transpose-with-character-numeric-variables-and-counts-percents
    https://github.com/rogerjdeangelis/utl_an_unsusual_transpose_based_on__groups_of_variable_names
    https://github.com/rogerjdeangelis/utl_classic_transpose_in_r_and_sas
    https://github.com/rogerjdeangelis/utl_diagonal_transpose_while_keeping_all_original_rows
    https://github.com/rogerjdeangelis/utl_excel_Import_and_transpose_range_A9-Y97_using_only_one_procedure
    https://github.com/rogerjdeangelis/utl_flexible_complex_multi-dimensional_transpose_using_one_proc_report
    https://github.com/rogerjdeangelis/utl_simple_three_dimensional_transpose_in_r_and_sas
    https://github.com/rogerjdeangelis/utl_sophisticated_transpose_with_proc_summary_idgroup
    https://github.com/rogerjdeangelis/utl_sort_summarize_and_transpose_multiple_variable_and_create_output_dataset
    https://github.com/rogerjdeangelis/utl_sort_summarize_transpose_and_format_in_1_datastep
    https://github.com/rogerjdeangelis/utl_sort_transpose_and_summarize_a_dataset_using_just_one_proc_report
    https://github.com/rogerjdeangelis/utl_sort_transpose_and_summarize_in_one_proc_v2
    https://github.com/rogerjdeangelis/utl_sort_transpose_summarize
    https://github.com/rogerjdeangelis/utl_sql_version_of_proc_transpose_with_major_advantage_of_summarization
    https://github.com/rogerjdeangelis/utl_techniques_to_transpose_and_stack_multiple_variables
    https://github.com/rogerjdeangelis/utl_transpose_and_concatenate_observations_by_id_in_one_datastep
    https://github.com/rogerjdeangelis/utl_transpose_long_to_wide_with_sequential_matching_pairs
    https://github.com/rogerjdeangelis/utl_transpose_multiple_variables_and_split_variables_into_multiple_variables
    https://github.com/rogerjdeangelis/utl_transpose_rows_to_column_identifying_type_of_data
    https://github.com/rogerjdeangelis/utl_transpose_table_by_two_variables_not_supported_by_proc_transpose
    https://github.com/rogerjdeangelis/utl_transpose_with_multiple_id_values_per_group
    https://github.com/rogerjdeangelis/utl_transpose_with_proc_report
    https://github.com/rogerjdeangelis/utl_transpose_with_proc_sql
    https://github.com/rogerjdeangelis/utl_transposing_multiple_variables_with_different_ids_a_single_transpose_cannot_do_this
    https://github.com/rogerjdeangelis/utl_two_families_itinerary_through_italy_transpose
    https://github.com/rogerjdeangelis/utl_using_a_hash_to_transpose_and_reorder_a_table
    https://github.com/rogerjdeangelis/utl-Unpivot-a-record-to-multiple-records-using-two-pivoted-columns
    https://github.com/rogerjdeangelis/utl-pivot-excel-columns-and-output-a-database-table
    https://github.com/rogerjdeangelis/utl-pivot-multiple-columns-to-long-format-untranspose


    /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */
