using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OnlineShoppingStore.Context;

namespace OnlineShoppingStore.Repository
{
    public class UnitOfWork : IDisposable
    {
        private OnlineShoppingStoreEntities _db = new OnlineShoppingStoreEntities();
        public IRepository<Entity> GetRepositoryInstance<Entity>() where Entity : class
        {
            return new Repository<Entity>(_db);
        }

        public void SaveChanges()
        {
            _db.SaveChanges();
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _db.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        private bool disposed = false;
    }
}