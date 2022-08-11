view: dim_customer {

  sql_table_name: CDP.DIM_CUSTOMER ;;

  dimension: customer_cd {
    label: "CUSTOMER_CD"
    primary_key: yes
    type: string
    sql: ${TABLE}.CUSTOMER_CD ;;
  }

  dimension: customer_name {
    label: "CUSTOMER_NAME"
    type: string
    sql: ${TABLE}.CUSTOMER_NAME ;;
  }

  dimension: customer_type {
    label: "CUSTOMER_TYPE"
    type: string
    sql: ${TABLE}.CUSTOMER_TYPE ;;
  }
  dimension: customer_industry {
    label: "CUSTOMER_INDUSTRY"
    type: string
    sql: ${TABLE}.CUSTOMER_INDUSTRY ;;
  }
  dimension: phone_number {
    label: "PHONE_NUMBER"
    type: string
    sql: ${TABLE}.PHONE_NUMBER ;;
  }
#
#
  dimension: address_line_1 {
    label: "ADDRESS_LINE_1"
    type: string
    sql: ${TABLE}.ADDRESS_LINE_1 ;;
  }
  dimension: address_line_2 {
    label: "ADDRESS_LINE_2"
    type: string
    sql: ${TABLE}.ADDRESS_LINE_2 ;;
  }
  dimension: city {
    label: "CITY"
    type: string
    sql: ${TABLE}.CITY ;;
  }
  dimension: postal_cd {
    label: "POSTAL_CD"
    type: string
    sql: ${TABLE}.POSTAL_CD ;;
  }
  dimension: province_name {
    label: "PROVINCE_NAME"
    type: string
    sql: ${TABLE}.PROVINCE_NAME ;;
  }
  dimension: region_name {
    label: "REGION_NAME"
    type: string
    sql: ${TABLE}.REGION_NAME ;;
  }
}
