#= 
    This code was generated by heta-compiler of v0.5.8
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    C = 1.0
    S4 = 0.0 / C
    k1 = 1.0
    S1 = 2.0 / C
    S2 = 2.0 / C
    reaction1 = C * k1 * S1 * S2 * t
    k2 = 0.9
    S3 = 0.0 / C
    reaction2 = C * k2 * S3 * t
    k3 = 0.7
    reaction3 = C * k3 * S3 * t
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
            S3 * C,
            S4 * C,
        ],
        
        [
            C,
            k1,
            k2,
            k3,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,k1,k2,k3,) = p.static
    (S1_,S2_,S3_,S4_,) = u 

    # Heta rules
    S4 = S4_ / C
    S1 = S1_ / C
    S2 = S2_ / C
    reaction1 = C * k1 * S1 * S2 * t
    S3 = S3_ / C
    reaction2 = C * k2 * S3 * t
    reaction3 = C * k3 * S3 * t
    
    #p.static .= [C,k1,k2,k3,]
    du .= [
      -reaction1+reaction2+reaction3,  # dS1_/dt
      -reaction1+reaction2,  # dS2_/dt
      reaction1-reaction2-reaction3,  # dS3_/dt
      reaction3,  # dS4_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,k1,k2,k3,) = integrator.p.static
        (S1_,S2_,S3_,S4_,) = u

        # Heta rules
        S4 = S4_ / C
        S1 = S1_ / C
        S2 = S2_ / C
        reaction1 = C * k1 * S1 * S2 * t
        S3 = S3_ / C
        reaction2 = C * k2 * S3 * t
        reaction3 = C * k3 * S3 * t
        
        # calculate amounts
        C_ = C
        reaction1_ = reaction1
        reaction2_ = reaction2
        reaction3_ = reaction3
        k1_ = k1
        k2_ = k2
        k3_ = k3

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events


### continous events


### event assignments


### OUTPUT ###

x00853 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00853 = x00853
)
tasks = ()

export models, tasks

end
