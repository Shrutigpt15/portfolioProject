--DATA CLEANING PROJECT QUERIES
select *
from NashvilleHousing

--SaleDate is in date-time format but if you look closely time isn't really recorded so let's get rid of it.

Select SaleDate,CONVERT(date,SaleDate) as Saledate
from NashvilleHousing

UPDATE NashvilleHousing
SET SaleDate= CONVERT(date,SaleDate)