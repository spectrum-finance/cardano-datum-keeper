module Repositories.DatumRepository where

import Plutus.V1.Ledger.Scripts  (Datum (..), DatumHash (..)) 
import Data.Maybe (Maybe (..))
import Database.PostgreSQL.Simple
import Database.PostgreSQL.Simple.FromRow
import Database.PostgreSQL.Simple.ToRow
import GHC.Base (($))
import Models.Api
import Models.Common 
  
data DatumRepository = DatumRepository { 
    putDatum :: Datum -> IO (), 
    getDatum :: DatumHash -> IO (Maybe Datum)
  }
  
mkDatumRepository :: Connection -> DatumRepository
mkDatumRepository conn = DatumRepository (putDatum' conn) (getDatum' conn)

putDatum' :: Connection -> Datum -> IO ()
putDatum' con dat = undefined --do
--  jsonDatum <- encode dat
--  execute con "insert into datum (datum_json) values (?)" dat

getDatum' :: Connection -> DatumHash -> IO (Maybe Datum)
getDatum' con dat = undefined
