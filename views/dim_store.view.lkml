view: dim_store {

  sql_table_name: CDP.DIM_STORE ;;

  dimension: store_cd {
    label: "STORE_CD"
    primary_key: yes
    type: string
    sql: ${TABLE}.STORE_CD ;;
  }

  dimension: store_name {
    label: "STORE_NAME"
    type: string
    sql: ${TABLE}.STORE_NAME ;;
  }
  dimension: store_size {
    label: "STORE_SIZE"
    type: string
    sql: ${TABLE}.STORE_SIZE ;;
  }
  # dimension: store_size {
  #   label: "STORE_SIZE"
  #   type: number
  #   sql: CAST(${TABLE}.STORE_SIZE as INTEGER);;
  # }
  # measure: store_size_int {
  #   label: "STORE_SIZE"
  #   type: number
  #   sql: ${store_size};;
  # }
}
