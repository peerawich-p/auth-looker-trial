view: fact_product_cost {

  sql_table_name: CDP.FACT_PRODUCT_COST;;

  dimension: date_cd {
    label: "DATE_CD"
    type: date_time
    sql: ${TABLE}.DATE_CD ;;
  }
  dimension: product_cd {
    label: "PRODUCT_CD"
    type: string
    sql: ${TABLE}.PRODUCT_CD ;;
  }
  measure: product_cost {
    label: "PRODUCT_COST"
    type: number
    sql: ${TABLE}.PRODUCT_COST ;;
  }
}
