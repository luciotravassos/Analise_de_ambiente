select name, value
  from v$parameter
 where name in
       ('_second_spare_parameter', 'parallel_max_servers',
        '_bloom_filter_enabled', '_in_memory_undo', '_index_join_enabled',
        '_optimizer_better_inlist_costing', '_table_lookup_prefetch_size',
        'log_checkpoint_interval', 'log_checkpoint_timeout', 'sga_max_size',
        'sga_target', 'shared_pool_reserved_size', 'sort_area_retained_size',
        'sort_area_size', 'processes', 'sessions', 'commit_write',
        'db_file_multiblock_read_count', 'optimizer_dynamic_sampling',
        'optimizer_features_enable', 'optimizer_mode',
        'nls_length_semantics', 'optimizer_index_caching',
        'db_block_buffers')