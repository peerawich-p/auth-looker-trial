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
}
