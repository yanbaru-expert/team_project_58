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
