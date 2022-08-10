view: dim_channel {

  sql_table_name: CDP.DIM_CHANNEL ;;

  dimension: channel_cd {
    label: "CHANNEL_CD"
    type: string
    sql: ${TABLE}.CHANNEL_CD ;;
  }

  dimension: channel_name_en {
    label: "CHANNEL_NAME_EN"
    type: string
    sql: ${TABLE}.CHANNEL_NAME_EN ;;
  }
}
