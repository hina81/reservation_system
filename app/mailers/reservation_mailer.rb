class ReservationMailer < ApplicationMailer
  default from: 'yokogawa.comfy@gmail.com'  # 送信元のメールアドレス

  def confirmation_email(reservation)
    @reservation = reservation
    mail(to: @reservation.email, subject: 'ご予約ありがとうございます！') do |format|
      format.text { render plain: "予約内容\n\nお名前: #{@reservation.full_name}\n予約日: #{@reservation.date}\n時間: #{@reservation.time}\n人数: #{@reservation.number_of_people}人" }
      format.html { render html: "<h1>ご予約ありがとうございます！</h1><p>お名前: #{@reservation.full_name}</p><p>予約日: #{@reservation.date}</p><p>来店時間: #{@reservation.time}</p><p>人数: #{@reservation.number_of_people}人</p>".html_safe }
    end
  end
end
