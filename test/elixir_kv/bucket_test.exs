defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link
    {:ok, bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 7)
    assert KV.Bucket.get(bucket, "milk") == 7
  end

  test "deletes values", %{bucket: bucket} do
    KV.Bucket.put(bucket, "milk", 7)

    assert KV.Bucket.delete(bucket, "milk") == 7
    assert KV.Bucket.get(bucket, "milk") == nil
  end
end
