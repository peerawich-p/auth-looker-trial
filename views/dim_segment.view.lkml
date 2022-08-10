view: dim_segment {

 sql_table_name: CDP.DIM_SEGMENT ;;

  dimension: segment_cd {
    label: "SEGMENT_CD"
    type: string
    sql: ${TABLE}.SEGMENT_CD ;;
  }

  dimension: segment_group_name {
    label: "SEGMENT_GROUP_NAME"
    type: string
    sql: ${TABLE}.SEGMENT_GROUP_NAME ;;
  }
  dimension: recency {
    label: "RECENCY"
    type: number
    sql: ${TABLE}.RECENCY ;;
  }
  dimension: frequency {
    label: "FREQUENCY"
    type: number
    sql: ${TABLE}.FREQUENCY ;;
  }
  dimension: monetary {
    label: "MONETARY"
    type: number
    sql: ${TABLE}.MONETARY ;;
  }

}
