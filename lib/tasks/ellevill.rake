# coding: utf-8
namespace :ellevill do
	task :update => :environment do
		urls = {"http://www.ellevill.org/category/wrapcotton/"=>'6'}
		urls.each_key do |url|
			cat = Nokogiri::HTML(open(url))
			cat.xpath('//a[@class="product-title"]/@href').each do |link|
				prod = Nokogiri::HTML(open("http://www.ellevill.org#{link}"))
				sku=prod.xpath('//p[@class="sku"]/span/span/span').first.content
				name=prod.xpath('//h1[@class="mainbox-title"]').first.content
				descr=prod.xpath('//div[@id="content_description"]/p').to_html
				descr.gsub!("M -46)", "M (44-46)")
				descr.gsub!(/http:\/\/www.ellevill.org\/product\/(.+?)\//, "/$1.html")
				descr.gsub!("http://www.ellevill.org/auxpage_nursingsize/", "/sizes.html")
				descr.gsub!(/<a href="http:\/\/www.ellevill.org\/.*">(.+?)<\/a>/, "/$1")
				price=prod.xpath('//p[@class="actual-price"]//span[@class="price-num"][1]').first.content;

				product=Product.find_or_create_by_name(name)
				product.name=name
				product.sku=sku
				product.description=descr
				product.price=price
				product.hidden=descr.include?("НЕТ В НАЛИЧИИ");
				product.category_id=urls[url]
				product.count=0 if !product.count or product.count==0

				Manufacturer.all.each do |man_name|
					if name.include?(man_name)
						product.manufacturer=Manufacturer.find_by_name(man_name)
					end
				end

				product.options.delete_all
				sizes=product.options.new(name: 'Размер')
				prod.xpath('//div[@class="form-field product-list-field clearfix"]/select/option').each do |size|
					size=size.content
					size.gsub!(/^\s*/, '')
					size.gsub!(/\s*$/, '')
					size.gsub!(/^Размер\s*/, '')
			 		next if (/(Не определено|слинг с кольцами)/.match size)
	 				if /(?<size2>.+?) \((?<delta>[-+]\d+)/ =~ size
	 					sizes.option_items.new(value: size2, delta: delta).save!
	 				else
	 					sizes.option_items.new(value: size, delta: 0).save!
	 				end
	 				sizes.save!
				end


				if product.new_record?
					prod.xpath('//a[contains(@class, "cloud-zoom")]/@href').each do |img_link|
						product.images.new.from_url("http://www.ellevill.org#{img_link}").save!
					end
				end
				puts "#{product.name}"
				product.save
			end
		end
	end
end