# :world_map: Catalog Search

```python
import up42
up42.authenticate(cfg_file="config.json")

catalog = up42.initialize_catalog()
catalog
```

## Search scenes in aoi


```python
#aoi = up42.read_vector_file("data/aoi_washington.geojson", 
#                           as_dataframe=False)
aoi = up42.get_example_aoi(location="Berlin", as_dataframe=True)
aoi
```


```python
search_paramaters = catalog.construct_parameters(geometry=aoi, 
                                                 start_date="2018-01-01",
                                                 end_date="2020-12-31",
                                                 sensors=["pleiades"],
                                                 max_cloudcover=20,
                                                 sortby="cloudCoverage", 
                                                 limit=5)
search_results = catalog.search(search_paramaters=search_paramaters)
display(search_results.head())
```


```python
catalog.plot_coverage(scenes=search_results, 
                      aoi=aoi, 
                      legend_column="scene_id")
```

## Quicklooks


```python
catalog.download_quicklooks(image_ids=search_results.id.to_list(), provider="oneatlas")  #oneatlas works
```


```python
catalog.plot_quicklooks(figsize=(20,20))
```
