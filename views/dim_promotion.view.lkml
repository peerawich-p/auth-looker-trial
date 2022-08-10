view: dim_promotion {

  sql_table_name: CDP.DIM_PROMOTION ;;

  dimension: promotion_cd {
    label: "PROMOTION_CD"
    type: string
    sql: ${TABLE}.PROMOTION_CD ;;
  }
  dimension: promotion_description {
    label: "PROMOTION_DESCRIPTION"
    type: string
    sql: ${TABLE}.PROMOTION_DESCRIPTION ;;
  }
  dimension: discount_pct {
    label: "DISCOUNT_PCT"
    type: string
    sql: ${TABLE}.DISCOUNT_PCT ;;
  }
  dimension: promotion_type {
    label: "PROMOTION_TYPE"
    type: string
    sql: ${TABLE}.PROMOTION_TYPE ;;
  }
  dimension: promotion_category {
    label: "PROMOTION_CATEGORY"
    type: string
    sql: ${TABLE}.PROMOTION_CATEGORY ;;
  }
  }
