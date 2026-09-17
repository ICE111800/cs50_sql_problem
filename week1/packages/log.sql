
-- *** The Lost Letter ***
SELECT addresses.id 
FROM addresses
WHERE addresses.address = '900 Somerville Avenue';
-- 先去拿寄件人寄件地址的id，得432
SELECT packages.id, packages.contents, packages.to_address_id
FROM packages
WHERE packages.from_address_id = 432;
-- 拿這寄件id去找包裹資訊，確定為id = 384的祝福信件包裹
SELECT *
FROM scans
WHERE scans.package_id = 384;
-- 發現最後drop在address_id = 854
SELECT *
FROM addresses
WHERE addresses.id = 854;
-- 再用addresses找遺失地點id
-- *** The Devious Delivery ***
SELECT *
FROM packages
WHERE packages.from_address_id IS NULL AND packages.contents LIKE '%duck%';
-- 報案人說寄件地址為null且跟鴨子叫聲有關，以此來找可能的包裹資訊
SELECT *
FROM scans
WHERE scans.package_id = 5098;
-- 利用查到的包裹id，來看物流狀態
SELECT *
FROM addresses
WHERE addresses.id = 348;
-- 根據物流資訊看到最後送達地址id = 348
-- *** The Forgotten Gift ***
SELECT *
FROM addresses
WHERE addresses.address = '109 Tileston Street';
-- 先找到爺爺寄件的地址id = 9873
SELECT *
FROM packages
WHERE packages.from_address_id = 9873;
-- 根據爺爺寄件地址，找包裹相關資訊 id = 9523
SELECT *
FROM scans
WHERE scans.package_id = 9523;
-- 看到物流資訊，看到物流id = 12432以及司機id = 17 拿走包裹後沒有送達紀錄
SELECT *
FROM drivers
WHERE drivers.id = 17;
-- 查到司機資訊