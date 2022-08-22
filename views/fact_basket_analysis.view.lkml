view: fact_basket_analysis {
  sql_table_name: CDP.FACT_CUSTOMER ;;
  dimension: base_product_cd {
    label: "BASE_PRODUCT_CD"
    type: string
    sql: ${TABLE}.BASE_PRODUCT_CD ;;
  }
  dimension: rec_product_cd {
    label: "REC_PRODUCT_CD"
    type: string
    sql: ${TABLE}.REC_PRODUCT_CD ;;
  }
  dimension: base_product_name {
    label: "BASE_PRODUCT_NAME"
    type: string
    sql: ${TABLE}.BASE_PRODUCT_NAME ;;
  }
  dimension: rec_product_name {
    label: "REC_PRODUCT_NAME"
    type: string
    sql: ${TABLE}.REC_PRODUCT_NAME ;;
  }
  measure: rec_product_cost {
    label: "REC_PRODUCT_COST"
    type: number
    sql: ${TABLE}.REC_PRODUCT_COST ;;
  }
  measure: rec_product_price {
    label: "REC_PRODUCT_PRICE"
    type: number
    sql: ${TABLE}.REC_PRODUCT_PRICE ;;
  }
  measure: rec_product_profit {
    label: "REC_PRODUCT_PROFIT"
    type: number
    sql: ${TABLE}.REC_PRODUCT_PROFIT ;;
  }
  measure: base_product_support {
    label: "BASE_PRODUCT_SUPPORT"
    type: number
    sql: ${TABLE}.BASE_PRODUCT_SUPPORT ;;
  }
  measure: rec_product_support {
    label: "REC_PRODUCT_SUPPORT"
    type: number
    sql: ${TABLE}.REC_PRODUCT_SUPPORT ;;
  }
  measure: support {
    label: "SUPPORT"
    type: number
    sql: ${TABLE}.SUPPORT ;;
  }
  measure: confidence {
    label: "CONFIDENCE"
    type: number
    sql: ${TABLE}.CONFIDENCE ;;
  }
  measure: lift {
    label: "LIFT"
    type: number
    sql: ${TABLE}.LIFT ;;
  }
  measure: leverage {
    label: "LEVERAGE"
    type: number
    sql: ${TABLE}.LEVERAGE ;;
  }
  measure: conviction {
    label: "CONVICTION"
    type: number
    sql: ${TABLE}.CONVICTION ;;
  }
}
