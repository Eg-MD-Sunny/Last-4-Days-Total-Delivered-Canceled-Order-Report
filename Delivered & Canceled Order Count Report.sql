-----|| 1st Part
-----|| Name: Last 4 Days Specfic Warehouse CancelOrder Count


Select   w.name					   [Warehouse]
		,Count(distinct s.OrderId) [OrderNumber]

From CancelledShipmentAfterPickup csa
left join Shipment s on csa.Id=s.Id
left Join Warehouse w on w.Id=s.WarehouseId
left Join Employee e on e.Id=s.DeliveredByCustomerId

Where csa.createdOn  >= '2022-08-13 22:00 +6:00'
and csa.createdOn  < '2022-08-17 00:00 +6:00'
and w.Id = 5

Group by w.name



-----|| 1st Part
-----|| Name: Last 4 Days Specfic Warehouse DaliveredOrder Count


Select w.Name		[Warehouser],
	   Count(*)     [Dalivered Order]

from ProductVariant pv
join ThingRequest tr on tr.ProductVariantId=pv.id
join thing t on t.id=tr.AssignedThingId
join Shipment s on s.id=tr.ShipmentId
join Warehouse w on w.id = s.WarehouseId

where s.ReconciledOn is not null
and s.ReconciledOn >= '2022-08-13 00:00 +06:00'
and s.ReconciledOn < '2022-08-17 00:00 +06:00'
and s.ShipmentStatus not in (1,9,10)
and IsReturned=0
and IsCancelled=0
and HasFailedBeforeDispatch=0
and IsMissingAfterDispatch=0
and pv.DistributionNetworkId = 1
and w.Id = 5

group by w.Name