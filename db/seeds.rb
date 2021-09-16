# texts, movies テーブルを再生成（関連付くテーブルを含む）
%w[texts movies].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY CASCADE")
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

class ImportCsv
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)
    # インポートするデータを格納するための空配列
    list = []
    # CSVファイルからインポートしたデータを格納
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    # メソッドの戻り値をインポートしたデータの配列とする
    list
  end

  def self.text_data
    # importクラスメソッドを呼び出し，テキストデータの配列を生成
    list = import("db/csv_data/text_data.csv")
    Text.create!(list)
  end

  def self.movie_data
    # importクラスメソッドを呼び出し，ムービーデータの配列を生成
    list = import("db/csv_data/movie_data.csv")
    Movie.create!(list)
  end
end

ImportCsv.text_data
ImportCsv.movie_data
