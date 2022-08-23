view: fact_product_reccomend {

  sql_table_name: CDP.FACT_PRODUCT_RECOMMEND ;;


#CUSTOMER_CD STRING
dimension: customer_cd {
  label: "CUSTOMER_CD"
  type: string
  sql: ${TABLE}.CUSTOMER_CD ;;
}
# PK, FK  BASE_PRODUCT_CD STRING
  dimension: base_product_cd {
    label: "BASE_PRODUCT_CD"
    type: string
    sql: ${TABLE}.BASE_PRODUCT_CD ;;
  }
  # FK  PEER_CUSTOMER_CD  STRING
  dimension: peer_customer_cd {
    label: "PEER_CUSTOMER_CD"
    type: string
    sql: ${TABLE}.PEER_CUSTOMER_CD ;;

  }
  # FK  REC_PRODUCT_CD_1  STRING

  dimension: rec_produc_cd_1 {
    label: "REC_PRODUCT_CD_1"
    type: string
    sql: ${TABLE}.REC_PRODUCT_CD_1 ;;

  }
  # FK  REC_PRODUCT_CD_2  STRING
  dimension: rec_product_cd2 {
    label: "REC_PRODUCT_CD_2"
    type: string
    sql: ${TABLE}.REC_PRODUCT_CD_2 ;;

  }
  # FK  REC_PRODUCT_CD_3  STRING
  dimension: rec_product_cd3 {
    label: "REC_PRODUCT_CD_3"
    type: string
    sql: ${TABLE}.REC_PRODUCT_CD_3 ;;

  }
  #   REC_PRODUCT_PROFIT_1  FLOAT
  measure: rec_product_profit_1 {
    label: "REC_PRODUCT_PROFIT_1"
    type: number
    sql: ${TABLE}.REC_PRODUCT_PROFIT_1 ;;

  }
  #   REC_PRODUCT_PROFIT_2  FLOAT
  measure: rec_product_profit_2 {
    label: "REC_PRODUCT_PROFIT_2"
    type: number
    sql: ${TABLE}.REC_PRODUCT_PROFIT_2 ;;

  }
  #   REC_PRODUCT_PROFIT_3  FLOAT
  measure: rec_product_profit_3 {
    label: "REC_PRODUCT_PROFIT_3"
    type: number
    sql: ${TABLE}.REC_PRODUCT_PROFIT_3 ;;

  }
}
