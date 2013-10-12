# coding: utf-8
namespace :ulmart do
	task :update => :environment do
		urls = {"http://www.ulmart.ru/catalog/DVR"=>'1',
				"http://www.ulmart.ru/catalog/radar_detector"=>'3',
				"http://www.ulmart.ru/catalog/gps_radio"=>'2',
				"http://www.ulmart.ru/catalog/92049"=>'4'}
		urls.each_key do |url|
			page=1
			while true
				cat = Nokogiri::HTML(open("#{url}?page=#{page}"))
				cat.xpath('//div[@class="b-product-list-item__title"]/a').each do |prod_item|
					prod_url=prod_item['href']
					name=prod_item.content
					name.gsub!('антирадар', 'Радар-детектор')
					puts "#{name}"
					next if not (name.index('DOD') or name.index('КАРКАМ') or name.index('Sho-Me')or name.index('Crunch')or name.index('Whistler')or name.index('Garmin')or name.index('Navitel')or name.index('парктроник'))
					prod = Nokogiri::HTML(open("http://www.ulmart.ru#{prod_url}"))
					sku=prod.xpath('//span[@class="b-art"]/span').first.content
					descr=prod.xpath('//section[@id="properties_full"]').to_html
					price=prod.xpath('//div[@class="b-product-card__price"]/span/span[1]').first.content;
					price.gsub!(/[[:space:]]/, '')

					product=Product.find_or_create_by_name(name)
					product.name=name
					product.sku=sku
					product.description=descr
					product.price=price
					product.hidden=false
					product.category_id=urls[url]
					product.count=0 if !product.count or product.count==0

					Manufacturer.all.each do |man|
						if name.include?(man.name)
							product.manufacturer=man
						end
					end


					product.images.clear
#					if product.new_record?
						product.images.new.from_url("http://fast.ulmart.ru/good_pics/#{sku}.jpg").save!
#					end
					product.save
				end
				break if cat.xpath('//div[@id="hide-show-more-lnk"]').first.content.to_i<=0
				page=page+1
			end
		end
	end
end