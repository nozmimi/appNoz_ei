class EconomicIndicatorController < ApplicationController

NOMINAL = "名目"
REAL = "実質"

  def index
    get_data_gdp("0003109766",REAL,CategoryList.all,SnaQuarterly.all) #国民経済計算（四半期＿実質
    get_api_url("0003109766")    
  end
  
  def show
  end
  
  def table
  end
  



  #（メモ）e-statのAPIアドレスを作成するメソッド
  def get_api_url(stats_data_id)
    api_url = "https://api.e-stat.go.jp/rest/2.1/app/json/getStatsData"
    api_appid = "bb86c86ee575b3adfa4930ee0f17a74de14e57e6"
    @req_url = api_url +"?appId=" + api_appid +"&statsDataId=" + stats_data_id
    puts @req_url
  end

  #（メモ）国民経済計算より（主にGDP）
  def get_data_gdp(stats_data_id,period_time,db_catlist,db_sna)

    # アクセスするURLを取得
    get_api_url(stats_data_id)

    # データの取得
    req_uri = URI.parse(@req_url)
    data_json = Net::HTTP.get(req_uri)
    data_all = JSON.parse(data_json, symbolize_names: true)

    # データの更新日時の取得
    update_date = data_all[:GET_STATS_DATA][:STATISTICAL_DATA][:TABLE_INF][:UPDATED_DATE]

    # 統計データ名の取得
    cat_code = data_all[:GET_STATS_DATA][:STATISTICAL_DATA][:TABLE_INF][:@id]
    cat_name = data_all[:GET_STATS_DATA][:STATISTICAL_DATA][:TABLE_INF][:STAT_NAME][:"$"]
    tb_title = data_all[:GET_STATS_DATA][:STATISTICAL_DATA][:TABLE_INF][:TITLE]
    
    puts cat_name
    puts tb_title

    # date,categoryの取り出し
    data_classobj = data_all[:GET_STATS_DATA][:STATISTICAL_DATA][:CLASS_INF][:CLASS_OBJ]
    # pp data_classobj

    # date,categoryごとのデータの取り出し
    data_datainf = data_all[:GET_STATS_DATA][:STATISTICAL_DATA][:DATA_INF]
    # pp data_datainf

    if db_catlist.count == 0 or db_catlist.find_by(category_code: cat_code) == nil
      db_catlist.create(table_title:tb_title, category_code:cat_code, category_name:cat_name ,update_date:update_date)
    elsif db_catlist.find_by(category_code: cat_code) != update_date
      db_catlist.update(table_title:tb_title,category_code:cat_code, category_name:cat_name ,update_date:update_date)
    end

    if db_sna.count == 0 or db_catlist.find_by(category_code: cat_code).update_date != db_sna[db_sna.count-1].update_date

        classobj_time = {}
        classobj_cat = {}

        data_classobj.each do |obj|
          case obj[:@id]
          when "time" then
            data_classobj_time = obj[:CLASS]
            # pp data_classobj_time
              data_classobj_time.each do |obj_time|
                classobj_time[obj_time[:@code]] = obj_time[:@name]
              end
          when "cat01" then
            data_classobj_cat = obj[:CLASS]
            # pp data_classobj_cat
              data_classobj_cat.each do  |obj_cat|
                classobj_cat[obj_cat[:@code]] = obj_cat[:@name]
              end
          end
        end

        data_datainf[:VALUE].each do |data_inf|
          db_sna.create(
            period_time:period_time,
            category_code:data_inf[:@cat01],
            category_name:classobj_cat[data_inf[:@cat01]],
            date_code:data_inf[:@time],
            date_name:classobj_time[data_inf[:@time]],
            "$data":data_inf[:"$"],
            "$unit":data_inf[:@unit],
            update_date:update_date
            )
        end
      end
  end



end #class end
