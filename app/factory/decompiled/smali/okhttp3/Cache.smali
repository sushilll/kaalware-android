.class public final Lokhttp3/Cache;
.super Ljava/lang/Object;
.source "Cache.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/io/Flushable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/Cache$CacheResponseBody;,
        Lokhttp3/Cache$Entry;,
        Lokhttp3/Cache$CacheRequestImpl;
    }
.end annotation


# static fields
.field private static final ENTRY_BODY:I = 0x1

.field private static final ENTRY_COUNT:I = 0x2

.field private static final ENTRY_METADATA:I = 0x0

.field private static final VERSION:I = 0x31191


# instance fields
.field final cache:Lokhttp3/internal/cache/DiskLruCache;

.field private hitCount:I

.field final internalCache:Lokhttp3/internal/cache/InternalCache;

.field private networkCount:I

.field private requestCount:I

.field writeAbortCount:I

.field writeSuccessCount:I


# direct methods
.method public constructor <init>(Ljava/io/File;J)V
    .registers 5
    .param p1, "directory"    # Ljava/io/File;
    .param p2, "maxSize"    # J

    .line 178
    sget-object v0, Lokhttp3/internal/io/FileSystem;->SYSTEM:Lokhttp3/internal/io/FileSystem;

    invoke-direct {p0, p1, p2, p3, v0}, Lokhttp3/Cache;-><init>(Ljava/io/File;JLokhttp3/internal/io/FileSystem;)V

    .line 179
    return-void
.end method

.method constructor <init>(Ljava/io/File;JLokhttp3/internal/io/FileSystem;)V
    .registers 12
    .param p1, "directory"    # Ljava/io/File;
    .param p2, "maxSize"    # J
    .param p4, "fileSystem"    # Lokhttp3/internal/io/FileSystem;

    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    new-instance v0, Lokhttp3/Cache$1;

    invoke-direct {v0, p0}, Lokhttp3/Cache$1;-><init>(Lokhttp3/Cache;)V

    iput-object v0, p0, Lokhttp3/Cache;->internalCache:Lokhttp3/internal/cache/InternalCache;

    .line 182
    const v3, 0x31191

    const/4 v4, 0x2

    move-object v1, p4

    move-object v2, p1

    move-wide v5, p2

    invoke-static/range {v1 .. v6}, Lokhttp3/internal/cache/DiskLruCache;->create(Lokhttp3/internal/io/FileSystem;Ljava/io/File;IIJ)Lokhttp3/internal/cache/DiskLruCache;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/Cache;->cache:Lokhttp3/internal/cache/DiskLruCache;

    .line 183
    return-void
.end method

.method private abortQuietly(Lokhttp3/internal/cache/DiskLruCache$Editor;)V
    .registers 3
    .param p1, "editor"    # Lokhttp3/internal/cache/DiskLruCache$Editor;

    .line 279
    if-eqz p1, :cond_8

    .line 280
    :try_start_2
    invoke-virtual {p1}, Lokhttp3/internal/cache/DiskLruCache$Editor;->abort()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    goto :goto_8

    .line 282
    :catch_6
    move-exception v0

    goto :goto_9

    .line 283
    :cond_8
    :goto_8
    nop

    .line 284
    :goto_9
    return-void
.end method

.method public static key(Lokhttp3/HttpUrl;)Ljava/lang/String;
    .registers 2
    .param p0, "url"    # Lokhttp3/HttpUrl;

    .line 186
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lokio/ByteString;->md5()Lokio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static readInt(Lokio/BufferedSource;)I
    .registers 7
    .param p0, "source"    # Lokio/BufferedSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 725
    :try_start_0
    invoke-interface {p0}, Lokio/BufferedSource;->readDecimalLong()J

    move-result-wide v0

    .line 726
    .local v0, "result":J
    invoke-interface {p0}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v2

    .line 727
    .local v2, "line":Ljava/lang/String;
    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-ltz v5, :cond_1d

    const-wide/32 v3, 0x7fffffff

    cmp-long v5, v0, v3

    if-gtz v5, :cond_1d

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 730
    long-to-int v3, v0

    return v3

    .line 728
    :cond_1d
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "expected an int but was \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "source":Lokio/BufferedSource;
    throw v3
    :try_end_3c
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_3c} :catch_3c

    .line 731
    .end local v0    # "result":J
    .end local v2    # "line":Ljava/lang/String;
    .restart local p0    # "source":Lokio/BufferedSource;
    :catch_3c
    move-exception v0

    .line 732
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 390
    iget-object v0, p0, Lokhttp3/Cache;->cache:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lokhttp3/internal/cache/DiskLruCache;->close()V

    .line 391
    return-void
.end method

.method public delete()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 306
    iget-object v0, p0, Lokhttp3/Cache;->cache:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lokhttp3/internal/cache/DiskLruCache;->delete()V

    .line 307
    return-void
.end method

.method public directory()Ljava/io/File;
    .registers 2

    .line 394
    iget-object v0, p0, Lokhttp3/Cache;->cache:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lokhttp3/internal/cache/DiskLruCache;->getDirectory()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public evictAll()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 314
    iget-object v0, p0, Lokhttp3/Cache;->cache:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lokhttp3/internal/cache/DiskLruCache;->evictAll()V

    .line 315
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 386
    iget-object v0, p0, Lokhttp3/Cache;->cache:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lokhttp3/internal/cache/DiskLruCache;->flush()V

    .line 387
    return-void
.end method

.method get(Lokhttp3/Request;)Lokhttp3/Response;
    .registers 8
    .param p1, "request"    # Lokhttp3/Request;

    .line 190
    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/Cache;->key(Lokhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object v0

    .line 194
    .local v0, "key":Ljava/lang/String;
    const/4 v1, 0x0

    :try_start_9
    iget-object v2, p0, Lokhttp3/Cache;->cache:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v2, v0}, Lokhttp3/internal/cache/DiskLruCache;->get(Ljava/lang/String;)Lokhttp3/internal/cache/DiskLruCache$Snapshot;

    move-result-object v2
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_f} :catch_36

    .line 195
    .local v2, "snapshot":Lokhttp3/internal/cache/DiskLruCache$Snapshot;
    if-nez v2, :cond_12

    .line 196
    return-object v1

    .line 201
    :cond_12
    nop

    .line 204
    :try_start_13
    new-instance v3, Lokhttp3/Cache$Entry;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lokhttp3/internal/cache/DiskLruCache$Snapshot;->getSource(I)Lokio/Source;

    move-result-object v4

    invoke-direct {v3, v4}, Lokhttp3/Cache$Entry;-><init>(Lokio/Source;)V
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_1d} :catch_31

    .line 208
    .local v3, "entry":Lokhttp3/Cache$Entry;
    nop

    .line 210
    invoke-virtual {v3, v2}, Lokhttp3/Cache$Entry;->response(Lokhttp3/internal/cache/DiskLruCache$Snapshot;)Lokhttp3/Response;

    move-result-object v4

    .line 212
    .local v4, "response":Lokhttp3/Response;
    invoke-virtual {v3, p1, v4}, Lokhttp3/Cache$Entry;->matches(Lokhttp3/Request;Lokhttp3/Response;)Z

    move-result v5

    if-nez v5, :cond_30

    .line 213
    invoke-virtual {v4}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v5

    invoke-static {v5}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 214
    return-object v1

    .line 217
    :cond_30
    return-object v4

    .line 205
    .end local v3    # "entry":Lokhttp3/Cache$Entry;
    .end local v4    # "response":Lokhttp3/Response;
    :catch_31
    move-exception v3

    .line 206
    .local v3, "e":Ljava/io/IOException;
    invoke-static {v2}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 207
    return-object v1

    .line 198
    .end local v2    # "snapshot":Lokhttp3/internal/cache/DiskLruCache$Snapshot;
    .end local v3    # "e":Ljava/io/IOException;
    :catch_36
    move-exception v2

    .line 200
    .local v2, "e":Ljava/io/IOException;
    return-object v1
.end method

.method public declared-synchronized hitCount()I
    .registers 2

    monitor-enter p0

    .line 422
    :try_start_1
    iget v0, p0, Lokhttp3/Cache;->hitCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    .end local p0    # "this":Lokhttp3/Cache;
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public initialize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 298
    iget-object v0, p0, Lokhttp3/Cache;->cache:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lokhttp3/internal/cache/DiskLruCache;->initialize()V

    .line 299
    return-void
.end method

.method public isClosed()Z
    .registers 2

    .line 398
    iget-object v0, p0, Lokhttp3/Cache;->cache:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lokhttp3/internal/cache/DiskLruCache;->isClosed()Z

    move-result v0

    return v0
.end method

.method public maxSize()J
    .registers 3

    .line 382
    iget-object v0, p0, Lokhttp3/Cache;->cache:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lokhttp3/internal/cache/DiskLruCache;->getMaxSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public declared-synchronized networkCount()I
    .registers 2

    monitor-enter p0

    .line 418
    :try_start_1
    iget v0, p0, Lokhttp3/Cache;->networkCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    .end local p0    # "this":Lokhttp3/Cache;
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method put(Lokhttp3/Response;)Lokhttp3/internal/cache/CacheRequest;
    .registers 8
    .param p1, "response"    # Lokhttp3/Response;

    .line 221
    invoke-virtual {p1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v0

    .line 223
    .local v0, "requestMethod":Ljava/lang/String;
    invoke-virtual {p1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lokhttp3/internal/http/HttpMethod;->invalidatesCache(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_21

    .line 225
    :try_start_17
    invoke-virtual {p1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v1

    invoke-virtual {p0, v1}, Lokhttp3/Cache;->remove(Lokhttp3/Request;)V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_1e} :catch_1f

    .line 228
    goto :goto_20

    .line 226
    :catch_1f
    move-exception v1

    .line 229
    :goto_20
    return-object v2

    .line 231
    :cond_21
    const-string v1, "GET"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2a

    .line 235
    return-object v2

    .line 238
    :cond_2a
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->hasVaryAll(Lokhttp3/Response;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 239
    return-object v2

    .line 242
    :cond_31
    new-instance v1, Lokhttp3/Cache$Entry;

    invoke-direct {v1, p1}, Lokhttp3/Cache$Entry;-><init>(Lokhttp3/Response;)V

    .line 243
    .local v1, "entry":Lokhttp3/Cache$Entry;
    const/4 v3, 0x0

    .line 245
    .local v3, "editor":Lokhttp3/internal/cache/DiskLruCache$Editor;
    :try_start_37
    iget-object v4, p0, Lokhttp3/Cache;->cache:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {p1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v5

    invoke-static {v5}, Lokhttp3/Cache;->key(Lokhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lokhttp3/internal/cache/DiskLruCache;->edit(Ljava/lang/String;)Lokhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v4

    move-object v3, v4

    .line 246
    if-nez v3, :cond_4d

    .line 247
    return-object v2

    .line 249
    :cond_4d
    invoke-virtual {v1, v3}, Lokhttp3/Cache$Entry;->writeTo(Lokhttp3/internal/cache/DiskLruCache$Editor;)V

    .line 250
    new-instance v4, Lokhttp3/Cache$CacheRequestImpl;

    invoke-direct {v4, p0, v3}, Lokhttp3/Cache$CacheRequestImpl;-><init>(Lokhttp3/Cache;Lokhttp3/internal/cache/DiskLruCache$Editor;)V
    :try_end_55
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_55} :catch_56

    return-object v4

    .line 251
    :catch_56
    move-exception v4

    .line 252
    .local v4, "e":Ljava/io/IOException;
    invoke-direct {p0, v3}, Lokhttp3/Cache;->abortQuietly(Lokhttp3/internal/cache/DiskLruCache$Editor;)V

    .line 253
    return-object v2
.end method

.method remove(Lokhttp3/Request;)V
    .registers 4
    .param p1, "request"    # Lokhttp3/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 258
    iget-object v0, p0, Lokhttp3/Cache;->cache:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v1

    invoke-static {v1}, Lokhttp3/Cache;->key(Lokhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/internal/cache/DiskLruCache;->remove(Ljava/lang/String;)Z

    .line 259
    return-void
.end method

.method public declared-synchronized requestCount()I
    .registers 2

    monitor-enter p0

    .line 426
    :try_start_1
    iget v0, p0, Lokhttp3/Cache;->requestCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    .end local p0    # "this":Lokhttp3/Cache;
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public size()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 378
    iget-object v0, p0, Lokhttp3/Cache;->cache:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lokhttp3/internal/cache/DiskLruCache;->size()J

    move-result-wide v0

    return-wide v0
.end method

.method declared-synchronized trackConditionalCacheHit()V
    .registers 2

    monitor-enter p0

    .line 414
    :try_start_1
    iget v0, p0, Lokhttp3/Cache;->hitCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lokhttp3/Cache;->hitCount:I
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 415
    monitor-exit p0

    return-void

    .line 413
    .end local p0    # "this":Lokhttp3/Cache;
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized trackResponse(Lokhttp3/internal/cache/CacheStrategy;)V
    .registers 3
    .param p1, "cacheStrategy"    # Lokhttp3/internal/cache/CacheStrategy;

    monitor-enter p0

    .line 402
    :try_start_1
    iget v0, p0, Lokhttp3/Cache;->requestCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lokhttp3/Cache;->requestCount:I

    .line 404
    iget-object v0, p1, Lokhttp3/internal/cache/CacheStrategy;->networkRequest:Lokhttp3/Request;

    if-eqz v0, :cond_12

    .line 406
    iget v0, p0, Lokhttp3/Cache;->networkCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lokhttp3/Cache;->networkCount:I

    goto :goto_1c

    .line 407
    .end local p0    # "this":Lokhttp3/Cache;
    :cond_12
    iget-object v0, p1, Lokhttp3/internal/cache/CacheStrategy;->cacheResponse:Lokhttp3/Response;

    if-eqz v0, :cond_1c

    .line 409
    iget v0, p0, Lokhttp3/Cache;->hitCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lokhttp3/Cache;->hitCount:I
    :try_end_1c
    .catchall {:try_start_1 .. :try_end_1c} :catchall_1e

    .line 411
    :cond_1c
    :goto_1c
    monitor-exit p0

    return-void

    .line 401
    .end local p1    # "cacheStrategy":Lokhttp3/internal/cache/CacheStrategy;
    :catchall_1e
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method update(Lokhttp3/Response;Lokhttp3/Response;)V
    .registers 7
    .param p1, "cached"    # Lokhttp3/Response;
    .param p2, "network"    # Lokhttp3/Response;

    .line 262
    new-instance v0, Lokhttp3/Cache$Entry;

    invoke-direct {v0, p2}, Lokhttp3/Cache$Entry;-><init>(Lokhttp3/Response;)V

    .line 263
    .local v0, "entry":Lokhttp3/Cache$Entry;
    invoke-virtual {p1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v1

    check-cast v1, Lokhttp3/Cache$CacheResponseBody;

    iget-object v1, v1, Lokhttp3/Cache$CacheResponseBody;->snapshot:Lokhttp3/internal/cache/DiskLruCache$Snapshot;

    .line 264
    .local v1, "snapshot":Lokhttp3/internal/cache/DiskLruCache$Snapshot;
    const/4 v2, 0x0

    .line 266
    .local v2, "editor":Lokhttp3/internal/cache/DiskLruCache$Editor;
    :try_start_e
    invoke-virtual {v1}, Lokhttp3/internal/cache/DiskLruCache$Snapshot;->edit()Lokhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v3

    move-object v2, v3

    .line 267
    if-eqz v2, :cond_1b

    .line 268
    invoke-virtual {v0, v2}, Lokhttp3/Cache$Entry;->writeTo(Lokhttp3/internal/cache/DiskLruCache$Editor;)V

    .line 269
    invoke-virtual {v2}, Lokhttp3/internal/cache/DiskLruCache$Editor;->commit()V
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_1b} :catch_1c

    .line 273
    :cond_1b
    goto :goto_20

    .line 271
    :catch_1c
    move-exception v3

    .line 272
    .local v3, "e":Ljava/io/IOException;
    invoke-direct {p0, v2}, Lokhttp3/Cache;->abortQuietly(Lokhttp3/internal/cache/DiskLruCache$Editor;)V

    .line 274
    .end local v3    # "e":Ljava/io/IOException;
    :goto_20
    return-void
.end method

.method public urls()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 327
    new-instance v0, Lokhttp3/Cache$2;

    invoke-direct {v0, p0}, Lokhttp3/Cache$2;-><init>(Lokhttp3/Cache;)V

    return-object v0
.end method

.method public declared-synchronized writeAbortCount()I
    .registers 2

    monitor-enter p0

    .line 370
    :try_start_1
    iget v0, p0, Lokhttp3/Cache;->writeAbortCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    .end local p0    # "this":Lokhttp3/Cache;
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized writeSuccessCount()I
    .registers 2

    monitor-enter p0

    .line 374
    :try_start_1
    iget v0, p0, Lokhttp3/Cache;->writeSuccessCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    .end local p0    # "this":Lokhttp3/Cache;
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method
