class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_menus, dependent: :destroy
  accepts_nested_attributes_for :workout_menus, allow_destroy: true
  validates_associated :workout_menus
  validates :start_time, presence: true
  validates :part, presence: true
  validates :body_weight, numericality: { greater_than: 30, less_than: 150 }, allow_blank: true
  validates :sleep, presence: true
  validates :eat, presence: true
  validates :motivation, presence: true
  validates :fatigue, presence: true
  validates :muscle, presence: true

  scope :search, -> (search_params) do
    return if search_params.blank?
    menu_like(search_params[:menu]).from_start_time(search_params[:from_start_time]).to_start_time(search_params[:to_start_time])
  end
  scope :menu_like, -> (menu) { where('workout_menus.menu LIKE ?', "#{menu}") if menu.present? }
  scope :from_start_time, -> (from) { where('? <= start_time', from) if from.present? }
  scope :to_start_time, -> (to) { where('start_time <= ?', to) if to.present? }

  SELECT_OPTIONS = [
    ['胸', [
      ['ベンチプレス', 'ベンチプレス'],
      ['インクライン・ベンチプレス', 'インクライン・ベンチプレス'],
      ['デクライン・ベンチプレス', 'デクライン・ベンチプレス'],
      ['ダンベルプレス', 'ダンベルプレス'],
      ['インクライン・ダンベルプレス', 'インクライン・ダンベルプレス'],
      ['デクライン・ダンベルプレス', 'デクライン・ダンベルプレス'],
      ['ダンベルフライ', 'ダンベルフライ'],
      ['インクライン・ダンベルフライ', 'インクライン・ダンベルフライ'],
      ['デクライン・ダンベルフライ', 'デクライン・ダンベルフライ'],
      ['ディップス', 'ディップス'],
      ['ペックフライ', 'ペックフライ'],
      ['マシンチェストプレス', 'マシンチェストプレス'],
      ['ワイドチェストプレス', 'ワイドチェストプレス']
      ]
    ],
    ['背中', [
      ['チンニング', 'チンニング'],
      ['ラットプルダウン', 'ラットプルダウン'],
      ['デッドリフト', 'デッドリフト'],
      ['トップサイドデッドリフト', 'トップサイドデッドリフト'],
      ['ベントオーバーロウ', 'ベントオーバーロウ'],
      ['ワンハンド・ダンベルロウ', 'ワンハンド・ダンベルロウ'],
      ['アイソラテラルロウ', 'アイソラテラルロウ'],
      ['DYロウ', 'DYロウ'],
      ['フロントプルダウン', 'フロントプルダウン'],
      ['プルオーバー', 'プルオーバー']
      ]
    ],
    ['肩', [
      ['バックプレス', 'バックプレス'],
      ['フロントプレス', 'フロントプレス'],
      ['スミスマシン・ショルダープレス', 'スミスマシン・ショルダープレス'],
      ['ダンベルショルダープレス', 'ダンベルショルダープレス'],
      ['アーノルドプレス', 'アーノルドプレス'],
      ['マシンショルダープレス', 'マシンショルダープレス'],
      ['サイドレイズ',  'サイドレイズ'],
      ['インクラインサイドレイズ', 'インクラインサイドレイズ'],
      ['フロントレイズ', 'フロントレイズ'],
      ['リアレイズ', 'リアレイズ'],
      ['リアデルト', 'リアデルト'],
      ['アップライトロウ', 'アップライトロウ']
      ]
    ],
    ['二頭', [
      ['バーベルカール', 'バーベルカール'],
      ['ダンベルカール', 'ダンベルカール'],
      ['インクラインダンベルカール', 'インクラインダンベルカール'],
      ['ワンハンドダンベルカール', 'ワンハンドダンベルカール'],
      ['ハンマーカール', 'ハンマーカール'],
      ['ケーブルカール', 'ケーブルカール'],
      ['マシン・カール', 'マシン・カール']
      ]
    ],
    ['三頭', [
        ['フレンチプレス', 'フレンチプレス'],
        ['スカルクラッシャー', 'スカルクラッシャー'],
        ['ナローベンチプレス', 'ナローベンチプレス'],
        ['プレスダウン', 'プレスダウン'],
        ['オーバーヘッドエクステンション', 'オーバーヘッドエクステンション'],
        ['トライセプスエクステンション', 'トライセプスエクステンション']
      ]
    ],
    ['脚', [
      ['スクワット', 'スクワット'],
      ['ハックスクワット', 'ハックスクワット'],
      ['ブルガリアンスクワット', 'ブルガリアンスクワット'],
      ['ルーマニアンデッドリフト', 'ルーマニアンデッドリフト'],
      ['レッグエクステンション', 'レッグエクステンション'],
      ['レッグカール', 'レッグカール'],
      ['ヒップスラスト', 'ヒップスラスト'],
      ['ヒップアブダクション', 'ヒップアブダクション'],
      ['ヒップアダクション', 'ヒップアブダクション'],
      ['カーフレイズ', 'カーフレイズ']
      ]
    ],
    ['腹筋', [
      ['ドラゴンフラッグ', 'ドラゴンフラッグ'],
      ['立ちコロ（アブローラー）', '立コロ（アブローラー）'],
      ['膝コロ（アブローラー）', '膝コロ（アブローラー）'],
      ['シットアップ', 'プランク'],
      ['トルソーローテーション', 'トルソーローテーション'],
      ['レッグレイズ', 'レッグレイズ']
    ]
  ],
  ]
end
