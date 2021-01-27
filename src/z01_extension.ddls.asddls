@AbapCatalog.sqlViewAppendName: 'Z01_EXENSION'
@EndUserText.label: 'Übung 14'
extend view Z01_Extended with Z01_Extension 
 association [1] to spfli as _connection on _connection.connid = b.connid
                                        and b.carrid = _connection.carrid
{
    b.class,
    b.counter,
    _connection
}
