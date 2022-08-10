view: dim_product {

  sql_table_name: CDP.DIM_PRODUCT ;;

  dimension: product_cd {
    label: "PRODUCT_CD"
    type: string
    sql: ${TABLE} ;;
  }
  dimension: product_name {
    label: "PRODUCT_NAME"
    type: string
    sql: ${TABLE}.PRODUCT_NAME ;;
  }
  dimension: product_color {
    label: "PRODUCT_COLOR"
    type: string
    sql: ${TABLE}.PRODUCT_COLOR ;;
  }
  dimension: product_size {
    label: "PRODUCT_SIZE"
    type: string
    sql: ${TABLE}.PRODUCT_SIZE ;;
  }
  dimension: product_weight {
    label: "PRODUCT_WEIGHT"
    type: string
    sql: ${TABLE}.PRODUCT_WEIGHT ;;
  }
  dimension: product_class {
    label: "PRODUCT_CLASS"
    type: string
    sql: ${TABLE}.PRODUCT_CLASS ;;
  }
  dimension: product_category_cd {
    label: "PRODUCT_CATEGORY_CD"
    type: string
    sql: ${TABLE}.PRODUCT_CATEGORY_CD ;;
  }
  dimension: product_category_name {
    label: "PRODUCT_CATEGORY_NAME"
    type: string
    sql: ${TABLE}.PRODUCT_CATEGORY_NAME ;;
  }
  dimension: product_sub_category_cd {
    label: "PRODUCT_SUB_CATEGORY_CD"
    type: string
    sql: ${TABLE}.PRODUCT_SUB_CATEGORY_CD ;;
  }
  dimension: product_sub_category_name {
    label: "PRODUCT_SUB_CATEGORY_NAME"
    type: string
    sql: ${TABLE}.PRODUCT_SUB_CATEGORY_NAME ;;
  }
}
