document.addEventListener 'turbolinks:load', ->
  hideSnapshots()
  showSnapshot()
  snapshotSelect = document.getElementById('snapshot-select')
  $(snapshotSelect).on 'change', ->
    showSnapshot($(this).val())

hideSnapshots = () ->
  snapshots = document.getElementsByClassName('property_snapshot')
  i = 0
  while i < snapshots.length
    $(snapshots[i]).hide()
    i++

showSnapshot = (snapshot_id) ->
  hideSnapshots()
  snapshot_id = if snapshot_id then snapshot_id else 'all_properties'
  snapshot = document.getElementById(snapshot_id)
  if snapshot_id then $(snapshot).show() else $('all_properties').show()
