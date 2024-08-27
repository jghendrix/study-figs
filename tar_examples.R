## Targets using

tar_make()
# run the entire workflow

tar_make(target)
# only run this specific object

# when you run tar_make(), it creates all these ojects as .Rds in the _targets folder. so they're generated in the backrgound, but if you actually want to interact with them, you want to _read or _load

tar_read(x)
# print object X - useful for figures, etc.

tar_load(x)
# bring object X into your environment as a df/list/etc.

tar_destroy()
# USE WITH CAUTION!!! deletes things from the root folder - if it took a long time to run your code already, you'll have to do it all over again... be careful

tar_invalidate()
# forces rerun even if targets thinks that thing is still up to date and doesn't need to be updated

tar_delete(X)
# destroys a specific target X

tar_visnetwork()

tar_mermaid()
tar_glimpse()
 # ^ all three of these let you visualize your workflow
# tar_vinetwork(targets_only = TRUE) is a cleaner view