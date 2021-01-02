using System.Collections.Generic;

namespace NeighboringStatesUS.DTO
{
    public class CountryStateNeighbor
    {
        public string Code { get; set; }
        public List<string> NeighborCodes { get; set; }
    }
}
