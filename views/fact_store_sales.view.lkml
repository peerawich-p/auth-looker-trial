view: fact_store_sales {

  derived_table: {
    sql: SELECT
        *
      FROM CDP.FACT_STORE_SALES
      ;;
  }

  dimension: date_cd {
    label: "DATE_CD"
    type: number
    sql: ${TABLE}.DATE_CD ;;
  }

  # dimension: store_cd {
  #   label: "STORE_CD"
  #   type: string
  #   sql: ${TABLE}.STORE_CD ;;
  # }

}
