<script>
    import { ethers } from 'ethers';
    import { dev } from '$app/environment';

    let tags = [];
  let notFound = false;

 let activeContract = "0x0221a85835DD42D82385146406c534A1f4Af5E6D";
 let connectIt = async () => {

    const we = window.ethereum;
    if (!we || typeof window.ethereum === 'undefined') {
      alert(`Web3 Wallet like Metamask Required`, 'alert');
      return;
    }
    we.on('chainChanged', async (chainId) => {
      // Time to reload your interface with the new chainId
      console.log('chainChanged', chainId);
      window.location.reload(); // recommendation from metamask
    });

    let provider = new ethers.providers.Web3Provider(we);
    await provider.send('eth_requestAccounts', []);

    let network;
    let signer;
    let signerAddress;
    let chainId;
    let isConnected = false;

    try {
      network = await provider.getNetwork();
      signer = provider.getSigner(0) || null;
      if (signer) {
        signerAddress = await signer.getAddress();
      }
      chainId = await we.request({ method: 'eth_chainId' });
    } catch (e) {
      if (e.reason === 'unknown account #0') {
        console.log('unknown account', e.code);
        isConnected = false;
        alert('unable to connect');
        return;
      } else {
        console.error('init error', { e });
      }
    }

    // check if dev
    const allowedNetwork = dev ? 4 : 4; // TODO 4: 1 ... currently hard coded to rink
    const allowedNetworkName = dev ? 'Rinkeby' : 'Mainnet';
    if (chainId != allowedNetwork) {
      alert(`Please connect to ${allowedNetworkName} ${chainId}`);
      return;
    }

    if (network && signerAddress && chainId) {
      isConnected = true;
    }

    if (!isConnected) {
      alert('unable to connect');
      return;
    }

    console.log(`connected ${signerAddress} ${chainId}`, { network });

    try {
      const contract = new ethers.Contract(
        activeContract,
        [
          // minimal
          "event TagSet(string,string)",
  "function existsTag(string) view returns (bool)",
  "function getTagRef(string) view returns (string)",
  "function jsonTags() view returns (string)"
        ],
        signer
      );
      let tagsJson = await contract.jsonTags();
      //alert(tagsJson);
      tags = JSON.parse(tagsJson);
      console.log({tags});
      notFound = false;
    } catch (e) {
      console.error('contract error', { e });
      notFound = true;
      tags = [];
    } finally {
    //   processing = false;
    }


 };
</script>    

<section class="m-auto p-8 min-h-screen w-full">
<div class="bg-white">
    <div class="mx-auto max-w-7xl py-12 px-4 sm:px-6 md:py-16 lg:px-8 lg:py-20">
      <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">
        <span class="block">Contract Tags: Demo</span>
        <span class="block text-emerald-500">Enter a contract address to view any tags</span>
      </h2>
    </div>
    {#if notFound}
    <h3 class="font-mono mb-8 p-12">Contract tags support not found</h3>
{/if}
    {#if tags.length}
    <div class="m-auto bg-gray-100 p-12 w-full">
        <h3 class="font-mono mb-8">Found tags:</h3>
    {#each tags as tag, i}
    {#if i%2 == 0}
    {#if tags[i+1] !== '0x0'}
    <a href={`https://www.etherscan.io/address/${tags[i+1]}`}>
      <span class="mx-4 inline-flex underline-offset-1 underline items-center rounded-full bg-green-100 px-3 py-0.5 text-sm font-medium text-green-800">{tag}</span>
    </a>
    {:else}
    <span class="mx-4 inline-flex items-center rounded-full bg-emerald-500 px-3 py-0.5 text-sm font-medium text-green-800">{tag}</span>
    {/if}      
      {/if}
      {/each}
    </div>
      {/if}

    <div class="grid grid-flow-col text-center p-12">
        <input
        name="address"
        title="Contract Address to Check"
        bind:value={activeContract}
        type="text"
        class="h-13 border-1 bg-gray-200 px-2 py-4 text-gray-800 placeholder-gray-400 focus:ring-0 sm:text-sm mt-4 float-right focus:outline-none focus:ring-2 focus:ring-emerald-500"
        placeholder="Contract Address To Check for Tags"
        role="combobox"
        aria-expanded="false"
        aria-controls="options"
      />

        <button
          type="button"
          on:click={connectIt}
          class="mt-6z m-auto p-4 px-24 shadow-[7px_7px_0px_0px_#9CA3AF] bg-gray-800 text-sm font-medium font-secondary text-white shadow-smz hover:opacity-95 focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:ring-offset-2"
          >Check</button
        >
      </div>

  </div>
</section>