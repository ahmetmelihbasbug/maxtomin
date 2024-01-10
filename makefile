EXTENSION = maxtomin        # the extensions name
DATA = ahm_maxtomin.sql     # script file to install

# postgres build stuff
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
